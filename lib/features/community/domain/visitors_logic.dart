import 'package:openbekci_api/openbekci_api.dart' hide Notification;

/// Visitors and parcels (mobile plan 7.1, decisions C2 and C3).

/// The server-issued QR token is the QR payload, verbatim: always
/// `obk1.<token>`, exactly what the guard's scanner and
/// `community.scanGateVisitor` take. Returns `null` when the server did not
/// issue one (managers never get it) or it is not in that format, so the
/// screen shows no QR rather than a code the gate would reject.
String? visitorQrPayload(String? qrToken) {
  final t = qrToken?.trim();
  if (t == null || t.isEmpty) return null;
  if (!t.startsWith('obk1.') || t.length <= 5) return null;
  return t;
}

/// A single-entry QR is valid for the registered window plus this much on
/// either side (decision C2 defaults).
const visitorWindowSlack = Duration(minutes: 30);

enum PassState { upcoming, valid, ended, cancelled, used }

/// Where a pre-registered visitor's pass stands at [now].
PassState passState(VisitorEntry e, DateTime now) {
  if (e.cancelled) return PassState.cancelled;
  if (e.arrivedAt != null) return PassState.used;
  final from = e.windowFrom.subtract(visitorWindowSlack);
  final to = e.windowTo.add(visitorWindowSlack);
  if (now.isBefore(from)) return PassState.upcoming;
  if (now.isAfter(to)) return PassState.ended;
  return PassState.valid;
}

/// Entries the resident pre-registered (or a recurring pass produced) that
/// are still expected, soonest first.
List<VisitorEntry> expectedVisitors(Iterable<VisitorEntry> all, DateTime now) {
  final list = [
    for (final e in all)
      if (e.source_ == VisitorEntrySource_Enum.preRegistered &&
          (passState(e, now) == PassState.upcoming ||
              passState(e, now) == PassState.valid))
        e,
  ]..sort((a, b) => a.windowFrom.compareTo(b.windowFrom));
  return list;
}

/// Everything else, latest first: used, ended, cancelled, walk-ins and the
/// entries of recurring visitors.
List<VisitorEntry> visitorHistory(Iterable<VisitorEntry> all, DateTime now) {
  final expected = {for (final e in expectedVisitors(all, now)) e.id};
  final list = [
    for (final e in all)
      if (!expected.contains(e.id)) e,
  ]..sort((a, b) => b.windowFrom.compareTo(a.windowFrom));
  return list;
}

/// The phases of an approval request on the countdown screen.
enum ApprovalPhase { pending, expired, approved, denied }

/// The phase at [now]: the server's status, except that a pending request
/// whose expiry has passed is expired for the user at once (the server flips
/// it a little later; a decision after expiry would be a 409).
ApprovalPhase approvalPhase(VisitorApprovalRequest r, DateTime now) {
  switch (r.status) {
    case VisitorApprovalRequestStatusEnum.approved:
      return ApprovalPhase.approved;
    case VisitorApprovalRequestStatusEnum.denied:
      return ApprovalPhase.denied;
    case VisitorApprovalRequestStatusEnum.expired:
      return ApprovalPhase.expired;
    case VisitorApprovalRequestStatusEnum.pending:
    case VisitorApprovalRequestStatusEnum.unknownDefaultOpenApi:
      return now.isBefore(r.expiresAt)
          ? ApprovalPhase.pending
          : ApprovalPhase.expired;
  }
}

/// Time left to answer; zero once expired.
Duration approvalRemaining(VisitorApprovalRequest r, DateTime now) {
  final left = r.expiresAt.difference(now);
  return left.isNegative ? Duration.zero : left;
}

/// `m:ss` of [d] for the countdown.
String countdownText(Duration d) {
  final total = d.inSeconds < 0 ? 0 : d.inSeconds;
  final m = total ~/ 60;
  final s = (total % 60).toString().padLeft(2, '0');
  return '$m:$s';
}

/// Parcels still waiting, oldest first (they have been waiting longest).
List<Delivery> waitingParcels(Iterable<Delivery> all) => [
  for (final d in all)
    if (d.status == DeliveryStatusEnum.waiting) d,
]..sort((a, b) => a.receivedAt.compareTo(b.receivedAt));

/// Collected parcels of the last [days] days, latest first.
List<Delivery> recentParcels(
  Iterable<Delivery> all,
  DateTime now, {
  int days = 30,
}) {
  final since = now.subtract(Duration(days: days));
  return [
    for (final d in all)
      if (d.status == DeliveryStatusEnum.collected &&
          (d.collectedAt ?? d.receivedAt).isAfter(since))
        d,
  ]..sort(
    (a, b) => (b.collectedAt ?? b.receivedAt).compareTo(
      a.collectedAt ?? a.receivedAt,
    ),
  );
}

/// ISO weekday numbers as short day labels are localized by the screen; this
/// validates a selection for a recurring visitor (at least one day, `HH:MM`
/// start before end).
bool recurringTimesValid(String start, String end) {
  final re = RegExp(r'^([01][0-9]|2[0-3]):[0-5][0-9]$');
  if (!re.hasMatch(start) || !re.hasMatch(end)) return false;
  return start.compareTo(end) < 0;
}
