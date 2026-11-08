import 'package:drift/native.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/db/database.dart';

void main() {
  group('CachePolicy (stale-while-revalidate over drift)', () {
    late AppDatabase db;
    late DateTime clock;
    late CachePolicy cache;

    setUp(() {
      db = AppDatabase.forTesting(NativeDatabase.memory());
      clock = DateTime.utc(2026, 11, 8, 12);
      cache = CachePolicy(db: db, instanceId: 'inst-1', now: () => clock);
    });

    tearDown(() => db.close());

    String decode(Object? j) => (j! as Map<String, Object?>)['v']! as String;

    test('first load: nothing cached, then the fresh value', () async {
      final states = await cache
          .watch<String>(
            key: 'k',
            fetch: () async => {'v': 'fresh'},
            decode: decode,
          )
          .toList();
      expect(states, hasLength(2));
      expect(states[0].data, isNull);
      expect(states[0].refreshing, isTrue);
      expect(states[1].data, 'fresh');
      expect(states[1].error, isNull);
      expect(states[1].fetchedAt, clock);
    });

    test('renders the cached value first, then the refreshed one', () async {
      await cache.write('k', {'v': 'old'});
      clock = clock.add(const Duration(minutes: 5));
      final states = await cache
          .watch<String>(
            key: 'k',
            fetch: () async => {'v': 'new'},
            decode: decode,
          )
          .toList();
      expect(states.map((s) => s.data), ['old', 'new']);
      expect(states.first.refreshing, isTrue);
      expect(states.last.fetchedAt, clock);
      // The refreshed value is what the next launch sees.
      expect((await cache.read('k'))!.json, {'v': 'new'});
    });

    test(
      'a failed refresh keeps the cached data and reports the error',
      () async {
        await cache.write('k', {'v': 'old'});
        final states = await cache
            .watch<String>(
              key: 'k',
              fetch: () async =>
                  throw const AppError(code: 'network', retryable: true),
              decode: decode,
            )
            .toList();
        final last = states.last;
        expect(last.data, 'old');
        expect(last.error!.code, 'network');
        expect(last.isOffline, isTrue);
        expect(last.isStale, isTrue);
      },
    );

    test('a failed first load has no data and an error', () async {
      final states = await cache
          .watch<String>(
            key: 'k',
            fetch: () async =>
                throw const AppError(code: 'internal_error', status: 500),
            decode: decode,
          )
          .toList();
      expect(states.last.hasData, isFalse);
      expect(states.last.error!.code, 'internal_error');
      expect(states.last.isOffline, isFalse);
    });

    test('maxAge skips the refetch for a fresh enough entry', () async {
      await cache.write('k', {'v': 'old'});
      var fetched = 0;
      final states = await cache
          .watch<String>(
            key: 'k',
            maxAge: const Duration(minutes: 10),
            fetch: () async {
              fetched++;
              return {'v': 'new'};
            },
            decode: decode,
          )
          .toList();
      expect(fetched, 0);
      expect(states.last.data, 'old');
      expect(states.last.refreshing, isFalse);
    });

    test('an undecodable cached row is ignored', () async {
      await cache.write('k', {'unexpected': true});
      final states = await cache
          .watch<String>(
            key: 'k',
            fetch: () async => {'v': 'fresh'},
            decode: decode,
          )
          .toList();
      expect(states.last.data, 'fresh');
    });

    test('rows are keyed by instance id', () async {
      await cache.write('k', {'v': 'a'});
      final other = CachePolicy(db: db, instanceId: 'inst-2', now: () => clock);
      expect(await other.read('k'), isNull);
      await other.write('k', {'v': 'b'});
      expect((await cache.read('k'))!.json, {'v': 'a'});
    });

    test('clearAll wipes every instance (sign-out)', () async {
      await cache.write('k', {'v': 'a'});
      await CachePolicy(
        db: db,
        instanceId: 'inst-2',
        now: () => clock,
      ).write('k', {'v': 'b'});
      await db.clearAll();
      expect(await cache.read('k'), isNull);
    });

    test('trimOlderThan drops old rows only', () async {
      await cache.write('old', {'v': 1});
      clock = clock.add(const Duration(days: 40));
      await cache.write('new', {'v': 2});
      final removed = await db.trimOlderThan(
        'inst-1',
        clock.subtract(const Duration(days: 30)),
      );
      expect(removed, 1);
      expect(await cache.read('old'), isNull);
      expect(await cache.read('new'), isNotNull);
    });
  });

  group('AppConfig', () {
    const json = {
      'app_name': 'Gul Sitesi',
      'default_server_url': 'https://gul.example.org',
      'relay_id': 'gul',
      'support_url': 'https://gul.example.org/help',
      'brand': {'seed_color': '#FF5722'},
    };

    test('reads brand tokens and defaults', () {
      final c = AppConfig.fromJson(json, flavor: Flavor.prod);
      expect(c.appName, 'Gul Sitesi');
      expect(c.relayId, 'gul');
      expect(c.seedColor, const Color(0xFFFF5722));
      expect(c.defaultServerUrl, 'https://gul.example.org');
      expect(c.flavor.isDev, isFalse);
    });

    test('a compile-time server override wins (dev flavor)', () {
      final c = AppConfig.fromJson(
        json,
        flavor: Flavor.dev,
        serverOverride: 'http://10.0.2.2:8484',
      );
      expect(c.defaultServerUrl, 'http://10.0.2.2:8484');
      expect(c.flavor.isDev, isTrue);
    });

    test('missing and null values fall back', () {
      final c = AppConfig.fromJson(const {
        'default_server_url': null,
      }, flavor: Flavor.prod);
      expect(c.appName, 'OpenBekci');
      expect(c.defaultServerUrl, isNull);
      expect(c.relayId, 'official');
    });

    test('parseHexColor', () {
      expect(parseHexColor('#1A73E8'), const Color(0xFF1A73E8));
      expect(parseHexColor('80112233'), const Color(0x80112233));
      expect(parseHexColor('nope'), isNull);
      expect(parseHexColor(null), isNull);
    });
  });
}
