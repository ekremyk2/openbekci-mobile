import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';

import '../support/fake_api.dart';

DiscoveryDocument doc({
  String serverVersion = '0.3.0',
  String minAndroid = '1.0.0',
  List<String> apiVersions = const ['v1'],
}) => DiscoveryDocument.fromJson(
  discoveryJson(
    serverVersion: serverVersion,
    minAndroid: minAndroid,
    apiVersions: apiVersions,
  ),
);

Matcher errorCode(String code) =>
    isA<AppError>().having((e) => e.code, 'code', code);

void main() {
  group('normalizeServerInput', () {
    String n(String s, {bool dev = false}) =>
        normalizeServerInput(s, allowInsecureLocal: dev);

    test('adds https and drops path, query and fragment', () {
      expect(n('example.org'), 'https://example.org');
      expect(n('  Example.ORG/some/path?x=1#f '), 'https://example.org');
      expect(n('https://example.org:8443/v1'), 'https://example.org:8443');
    });

    test('rejects plain http for real hosts', () {
      expect(
        () => n('http://example.org'),
        throwsA(errorCode('insecure_server')),
      );
      expect(
        () => n('http://localhost:8484'),
        throwsA(errorCode('insecure_server')),
        reason: 'even loopback is https-only outside the dev flavor',
      );
    });

    test('dev flavor allows http for loopback and the emulator alias only', () {
      expect(n('http://localhost:8484', dev: true), 'http://localhost:8484');
      expect(n('http://10.0.2.2:8484', dev: true), 'http://10.0.2.2:8484');
      expect(n('http://127.0.0.1:8484', dev: true), 'http://127.0.0.1:8484');
      expect(
        () => n('http://example.org', dev: true),
        throwsA(errorCode('insecure_server')),
      );
    });

    test('dev flavor refuses http for hosts the network config blocks', () {
      for (final host in ['[::1]', '192.168.1.5', 'localhost.evil.org']) {
        expect(
          () => n('http://$host:8484', dev: true),
          throwsA(errorCode('insecure_server')),
          reason: host,
        );
      }
    });

    test('rejects garbage', () {
      for (final bad in ['', '   ', 'ftp://x.org', 'https://']) {
        expect(
          () => n(bad),
          throwsA(errorCode('not_openbekci')),
          reason: '"$bad"',
        );
      }
    });
  });

  group('compareVersions', () {
    test('orders numerically, not lexically', () {
      expect(compareVersions('1.10.0', '1.9.0'), greaterThan(0));
      expect(compareVersions('1.0.0', '1.0.0'), 0);
      expect(compareVersions('0.9.9', '1.0.0'), lessThan(0));
    });

    test('ignores build and pre-release suffixes, pads missing parts', () {
      expect(compareVersions('1.0.0+5', '1.0.0'), 0);
      expect(compareVersions('1.0.0-dev', '1.0.0'), 0);
      expect(compareVersions('1.2', '1.2.0'), 0);
    });
  });

  group('version gate', () {
    test('open for a current app and a supported server', () {
      expect(checkVersionGate(doc(), appVersion: '1.0.0'), isA<GateOpen>());
    });

    test('app older than min_app_version', () {
      final gate = checkVersionGate(
        doc(minAndroid: '2.0.0'),
        appVersion: '1.4.0',
      );
      expect(gate, isA<GateAppTooOld>());
      expect((gate as GateAppTooOld).minVersion, '2.0.0');
    });

    test('server older than the supported range', () {
      expect(
        checkVersionGate(doc(serverVersion: '0.0.9'), appVersion: '1.0.0'),
        isA<GateServerUnsupported>(),
      );
    });

    test('server without v1', () {
      expect(
        checkVersionGate(doc(apiVersions: ['v2']), appVersion: '1.0.0'),
        isA<GateServerUnsupported>(),
      );
    });

    test('a development build (server_version "dev") is not gated', () {
      expect(
        checkVersionGate(doc(serverVersion: 'dev'), appVersion: '1.0.0'),
        isA<GateOpen>(),
      );
    });

    test('a newer server is fine', () {
      expect(
        checkVersionGate(doc(serverVersion: '3.2.1'), appVersion: '1.0.0'),
        isA<GateOpen>(),
      );
    });
  });

  group('fetchDiscovery', () {
    ApiClient client(FakeAdapter a) => ApiClient.create(
      origin: 'https://example.org',
      userAgent: 't',
      locale: () => 'en',
      adapter: a,
    );

    test('returns the document and the instance id', () async {
      final a = FakeAdapter()
        ..answer(
          'GET /.well-known/openbekci.json',
          FakeResponse.ok(discoveryJson()),
        );
      final d = await fetchDiscovery(client(a));
      expect(d.instanceName, 'Gul Sitesi');
      expect(d.instanceId, '0192a3f0-1000-7000-8000-000000000999');
      expect(d.authMethodIds, ['password', 'sms_otp', 'magic_link']);
      expect(d.origin, 'https://example.org');
    });

    test('a 404 means this is not an OpenBekci server', () async {
      final a = FakeAdapter();
      await expectLater(
        fetchDiscovery(client(a)),
        throwsA(errorCode('not_openbekci')),
      );
    });

    test('unknown auth methods and extra fields are tolerated', () async {
      final json = discoveryJson(
        methods: ['password', 'oidc:google', 'passkey'],
      )..['future_field'] = {'x': 1};
      final a = FakeAdapter()
        ..answer('GET /.well-known/openbekci.json', FakeResponse.ok(json));
      final d = await fetchDiscovery(client(a));
      expect(d.authMethodIds, ['password', 'oidc:google', 'passkey']);
    });
  });

  test('originOfApiBase strips /v1', () {
    expect(originOfApiBase('https://example.org/v1'), 'https://example.org');
    expect(originOfApiBase('https://example.org/v1/'), 'https://example.org');
    expect(originOfApiBase('http://10.0.2.2:8484/v1'), 'http://10.0.2.2:8484');
    expect(
      originOfApiBase('https://example.org/sub/v1'),
      'https://example.org/sub',
    );
  });
}
