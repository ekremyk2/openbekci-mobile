import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/idempotency.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/community/domain/booking_logic.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';

/// One `Idempotency-Key` per distinct write of the community screens, so a
/// retry after a timeout reuses it (bookings, visitor entries, decisions).
final idempotencyKeysProvider = Provider<IdempotencyKeys>(
  (ref) => IdempotencyKeys(),
);

/// A unit the person lives in, for the unit pickers.
@immutable
class ResidentUnit {
  const new({required this.unitId, required this.label, required this.role});

  final String unitId;
  final String label;
  final OccupancyRole role;

  @override
  bool operator ==(Object other) =>
      other is ResidentUnit && other.unitId == unitId && other.role == role;

  @override
  int get hashCode => Object.hash(unitId, role);
}

/// The units the person currently lives in (former residents have none).
List<ResidentUnit> residentUnits(Iterable<MeOccupancy> occupancies) {
  final seen = <String>{};
  return [
    for (final o in occupancies)
      if (o.kind != MeOccupancyKindEnum.formerOccupant &&
          o.kind != MeOccupancyKindEnum.unknownDefaultOpenApi &&
          seen.add(o.unitId))
        ResidentUnit(
          unitId: o.unitId,
          label: o.unitLabel,
          role: switch (o.kind) {
            MeOccupancyKindEnum.owner => OccupancyRole.owner,
            MeOccupancyKindEnum.tenant => OccupancyRole.tenant,
            _ => OccupancyRole.household,
          },
        ),
  ];
}

final residentUnitsProvider = Provider<List<ResidentUnit>>((ref) {
  final ctx = ref.watch(orgContextProvider);
  return residentUnits(ctx?.occupancies ?? const []);
});

// ---------------------------------------------------------------------------
// Bookings
// ---------------------------------------------------------------------------

final facilitiesProvider = StreamProvider<CacheState<List<Facility>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Facility>>(
    ref,
    key: 'org/${scope.orgId}/facilities',
    fetch: (api) async => [
      for (final f in await fetchPages<Facility>((cursor) async {
        final page = await unwrap(
          () => api.community.communityListFacilities(
            orgId: scope.orgId,
            siteId: siteId,
            enabled: true,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        f.toJson(),
    ],
    decode: (j) => decodeList(j, Facility.fromJson),
  );
});

/// Bookings of the person's unit(s): `mine=true` (the server limits residents
/// to their own unit).
final myBookingsProvider = StreamProvider<CacheState<List<Booking>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Booking>>(
    ref,
    key: 'org/${scope.orgId}/bookings',
    fetch: (api) async => [
      for (final b in await fetchPages<Booking>((cursor) async {
        final page = await unwrap(
          () => api.community.communityListBookings(
            orgId: scope.orgId,
            siteId: siteId,
            mine: true,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        b.toJson(),
    ],
    decode: (j) => decodeList(j, Booking.fromJson),
  );
});

/// Taken and blocked slots of a facility over [from, to). Live, not cached:
/// a stale picture would offer slots that are gone.
typedef AvailabilityQuery = ({String facilityId, DateTime from, DateTime to});

final availabilityProvider = FutureProvider.autoDispose
    .family<Availability, AvailabilityQuery>((ref, q) async {
      final scope = ref.watch(scopeProvider);
      final api = ref.watch(apiProvider);
      if (scope == null || api == null) {
        throw const AppError(code: 'unauthenticated');
      }
      return await unwrap(
        () => api.community.communityGetFacilityAvailability(
          orgId: scope.orgId,
          facilityId: q.facilityId,
          from: q.from.toUtc().toIso8601String(),
          to: q.to.toUtc().toIso8601String(),
        ),
      );
    });

String _bookingFingerprint(
  String facilityId,
  String unitId,
  DateTime start,
  DateTime end,
  DebtorKindForFee? debtor,
) =>
    'booking:$facilityId:$unitId:${start.toUtc().toIso8601String()}:'
    '${end.toUtc().toIso8601String()}:${debtor?.name ?? ''}';

/// Books [facility] for [unitId]: confirms instantly. The `Idempotency-Key`
/// is kept per request, so a retry after a timeout returns the first
/// booking instead of a second one (409 `conflict` for a taken slot).
Future<Booking> createBooking(
  WidgetRef ref, {
  required Facility facility,
  required String unitId,
  required DateTime start,
  required DateTime end,
  DebtorKindForFee? debtor,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = _bookingFingerprint(facility.id, unitId, start, end, debtor);
  final booking = await unwrap(
    () => api.community.communityCreateBooking(
      orgId: scope.orgId,
      idempotencyKey: keys.keyFor(fp),
      bookingCreate: BookingCreate(
        facilityId: facility.id,
        unitId: unitId,
        start: start.toUtc(),
        end: end.toUtc(),
        debtorKind: switch (debtor) {
          DebtorKindForFee.owner => BookingCreateDebtorKindEnum.owner,
          DebtorKindForFee.tenant => BookingCreateDebtorKindEnum.tenant,
          null => null,
        },
      ),
    ),
  );
  keys.done(fp);
  ref
    ..invalidate(myBookingsProvider)
    ..invalidate(dashboardProvider);
  return booking;
}

/// Side charged for a fee when it is not the booker's default.
enum DebtorKindForFee { owner, tenant }

/// Cancels a booking; the server refunds the fee when it is before the
/// facility's cutoff.
Future<Booking> cancelBooking(WidgetRef ref, Booking booking) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = 'cancel-booking:${booking.id}';
  final out = await unwrap(
    () => api.community.communityCancelBooking(
      orgId: scope.orgId,
      bookingId: booking.id,
      idempotencyKey: keys.keyFor(fp),
      // An optional body the generated client would send as `null` (a 422).
      bookingCancel: BookingCancel(),
    ),
  );
  keys.done(fp);
  ref
    ..invalidate(myBookingsProvider)
    ..invalidate(dashboardProvider);
  return out;
}

// ---------------------------------------------------------------------------
// Visitors
// ---------------------------------------------------------------------------

final visitorEntriesProvider = StreamProvider<CacheState<List<VisitorEntry>>>((
  ref,
) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<VisitorEntry>>(
    ref,
    key: 'org/${scope.orgId}/visitor-entries',
    fetch: (api) async => [
      for (final e in await fetchPages<VisitorEntry>((cursor) async {
        final page = await unwrap(
          () => api.community.communityListVisitorEntries(
            orgId: scope.orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        e.toJson(),
    ],
    decode: (j) => decodeList(j, VisitorEntry.fromJson),
  );
});

final recurringVisitorsProvider =
    StreamProvider<CacheState<List<RecurringVisitor>>>((ref) {
      final scope = ref.watch(scopeProvider);
      final siteId = scope?.siteId;
      if (scope == null || siteId == null) return const Stream.empty();
      return watchCached<List<RecurringVisitor>>(
        ref,
        key: 'org/${scope.orgId}/recurring-visitors',
        fetch: (api) async => [
          for (final r in await fetchPages<RecurringVisitor>((cursor) async {
            final page = await unwrap(
              () => api.community.communityListRecurringVisitors(
                orgId: scope.orgId,
                siteId: siteId,
                cursor: cursor,
              ),
            );
            return (items: page.items, next: page.nextCursor);
          }))
            r.toJson(),
        ],
        decode: (j) => decodeList(j, RecurringVisitor.fromJson),
      );
    });

/// The approve / deny requests of the person's unit(s), newest first (the
/// server polls them while pending; so does the request screen).
final approvalRequestsProvider =
    StreamProvider<CacheState<List<VisitorApprovalRequest>>>((ref) {
      final scope = ref.watch(scopeProvider);
      if (scope == null) return const Stream.empty();
      return watchCached<List<VisitorApprovalRequest>>(
        ref,
        key: 'org/${scope.orgId}/visitor-approval-requests',
        fetch: (api) async => [
          for (final r in await fetchPages<VisitorApprovalRequest>((
            cursor,
          ) async {
            final page = await unwrap(
              () => api.community.communityListVisitorApprovalRequests(
                orgId: scope.orgId,
                cursor: cursor,
              ),
            );
            return (items: page.items, next: page.nextCursor);
          }, maxPages: 2))
            r.toJson(),
        ],
        decode: (j) => decodeList(j, VisitorApprovalRequest.fromJson),
      );
    });

/// Pre-registers a visitor; the response carries the QR token. Retrying the
/// same form reuses the key.
Future<VisitorEntry> createVisitorEntry(
  WidgetRef ref, {
  required String siteId,
  required String unitId,
  required String name,
  required DateTime from,
  required DateTime to,
  String? plate,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp =
      'visitor:$unitId:$name:${plate ?? ''}:${from.toUtc().toIso8601String()}:'
      '${to.toUtc().toIso8601String()}';
  final entry = await unwrap(
    () => api.community.communityCreateVisitorEntry(
      orgId: scope.orgId,
      idempotencyKey: keys.keyFor(fp),
      visitorEntryCreate: VisitorEntryCreate(
        siteId: siteId,
        unitId: unitId,
        name: name,
        plate: (plate == null || plate.isEmpty) ? null : plate,
        windowFrom: from.toUtc(),
        windowTo: to.toUtc(),
      ),
    ),
  );
  keys.done(fp);
  ref.invalidate(visitorEntriesProvider);
  return entry;
}

Future<VisitorEntry> cancelVisitorEntry(WidgetRef ref, VisitorEntry e) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = 'cancel-visitor:${e.id}';
  final out = await unwrap(
    () => api.community.communityCancelVisitorEntry(
      orgId: scope.orgId,
      entryId: e.id,
      idempotencyKey: keys.keyFor(fp),
    ),
  );
  keys.done(fp);
  ref.invalidate(visitorEntriesProvider);
  return out;
}

Future<RecurringVisitor> createRecurringVisitor(
  WidgetRef ref, {
  required String siteId,
  required String unitId,
  required String name,
  required List<int> days,
  required String start,
  required String end,
  required String validFrom,
  String? plate,
  String? validTo,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp =
      'recurring:$unitId:$name:${plate ?? ''}:${days.join(',')}:$start:$end:'
      '$validFrom:${validTo ?? ''}';
  final out = await unwrap(
    () => api.community.communityCreateRecurringVisitor(
      orgId: scope.orgId,
      idempotencyKey: keys.keyFor(fp),
      recurringVisitorCreate: RecurringVisitorCreate(
        siteId: siteId,
        unitId: unitId,
        name: name,
        plate: (plate == null || plate.isEmpty) ? null : plate,
        days: days,
        start: start,
        end: end,
        validFrom: validFrom,
        validTo: validTo,
      ),
    ),
  );
  keys.done(fp);
  ref.invalidate(recurringVisitorsProvider);
  return out;
}

Future<RecurringVisitor> revokeRecurringVisitor(
  WidgetRef ref,
  RecurringVisitor r,
) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = 'revoke-recurring:${r.id}';
  final out = await unwrap(
    () => api.community.communityRevokeRecurringVisitor(
      orgId: scope.orgId,
      recurringVisitorId: r.id,
      idempotencyKey: keys.keyFor(fp),
    ),
  );
  keys.done(fp);
  ref.invalidate(recurringVisitorsProvider);
  return out;
}

/// A decision the user chose on a button of the notification itself. Only the
/// notification path arms it (in memory, one answer, short-lived); a deep link
/// or a tapped URL cannot, so opening `/more/visitors/requests/{id}` from
/// anywhere else never answers by itself.
class PendingDecisions {
  static const ttl = Duration(minutes: 2);

  String? _requestId;
  bool _approve = false;
  DateTime? _armedAt;

  void arm(String requestId, {required bool approve, required DateTime now}) {
    _requestId = requestId;
    _approve = approve;
    _armedAt = now;
  }

  /// The armed answer for [requestId], once; `null` when there is none, it
  /// is for another request or it is older than [ttl].
  bool? take(String requestId, DateTime now) {
    final id = _requestId;
    final at = _armedAt;
    if (id != requestId || at == null) return null;
    if (now.difference(at).abs() >= ttl) return null;
    _requestId = null;
    _armedAt = null;
    return _approve;
  }

  void clear() {
    _requestId = null;
    _armedAt = null;
  }
}

final pendingDecisionsProvider = Provider<PendingDecisions>(
  (ref) => PendingDecisions(),
);

/// Answers an approval request. After expiry the server answers 409
/// `conflict`: the screen then shows the gate-contact hint.
Future<VisitorApprovalRequest> decideApproval(
  WidgetRef ref,
  VisitorApprovalRequest request, {
  required bool approve,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = 'decide:${request.id}:${approve ? 'approve' : 'deny'}';
  try {
    final out = await unwrap(
      () => api.community.communityDecideVisitorApprovalRequest(
        orgId: scope.orgId,
        requestId: request.id,
        idempotencyKey: keys.keyFor(fp),
        visitorDecision: VisitorDecision(
          decision: approve
              ? VisitorDecisionDecisionEnum.approve
              : VisitorDecisionDecisionEnum.deny,
        ),
      ),
    );
    keys.done(fp);
    return out;
  } finally {
    ref
      ..invalidate(approvalRequestsProvider)
      ..invalidate(visitorEntriesProvider)
      ..invalidate(dashboardProvider);
  }
}

// ---------------------------------------------------------------------------
// Parcels
// ---------------------------------------------------------------------------

/// Parcels of the person's unit(s): waiting and the recently collected.
final parcelsProvider = StreamProvider<CacheState<List<Delivery>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Delivery>>(
    ref,
    key: 'org/${scope.orgId}/deliveries',
    fetch: (api) async => [
      for (final d in await fetchPages<Delivery>((cursor) async {
        final page = await unwrap(
          () => api.community.communityListDeliveries(
            orgId: scope.orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        d.toJson(),
    ],
    decode: (j) => decodeList(j, Delivery.fromJson),
  );
});

/// "Now" for the community and governance screens (countdowns, booking
/// windows, poll state); tests override it.
final nowProvider = Provider<DateTime Function()>((ref) => DateTime.now);
