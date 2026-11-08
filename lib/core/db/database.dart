import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

/// Read cache rows: one JSON document per `(instance, key)`.
///
/// The cache is keyed by instance id from day one so multi-account support
/// does not need a migration (mobile plan section 5.2).
class CacheEntries extends Table {
  TextColumn get instanceId => text()();
  TextColumn get key => text()();
  TextColumn get payload => text()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {instanceId, key};
}

/// The drift (SQLite) read cache (mobile plan section 8). Writes are
/// online-only; this database never holds data the server does not have.
@DriftDatabase(tables: [CacheEntries])
class AppDatabase extends _$AppDatabase {
  new() : super(driftDatabase(name: 'openbekci_cache'));

  /// In-memory or custom executor, for tests.
  new forTesting(super.e);

  @override
  int get schemaVersion => 1;

  Future<CacheEntry?> readEntry(String instanceId, String key) {
    return (select(cacheEntries)
          ..where((t) => t.instanceId.equals(instanceId) & t.key.equals(key)))
        .getSingleOrNull();
  }

  Future<void> writeEntry({
    required String instanceId,
    required String key,
    required String payload,
    required DateTime fetchedAt,
  }) {
    return into(cacheEntries).insertOnConflictUpdate(
      CacheEntriesCompanion.insert(
        instanceId: instanceId,
        key: key,
        payload: payload,
        fetchedAt: fetchedAt,
      ),
    );
  }

  /// Deletes every row (sign-out).
  Future<void> clearAll() => delete(cacheEntries).go();

  /// Deletes rows of [instanceId] older than [cutoff] (age-based trimming).
  Future<int> trimOlderThan(String instanceId, DateTime cutoff) {
    return (delete(cacheEntries)..where(
          (t) =>
              t.instanceId.equals(instanceId) &
              t.fetchedAt.isSmallerThanValue(cutoff),
        ))
        .go();
  }
}
