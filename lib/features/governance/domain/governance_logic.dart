import 'package:openbekci_api/openbekci_api.dart' hide Notification;

/// Assembly, polls and decisions (mobile plan 7.1 "Governance", decisions G1,
/// G2 and G4).

/// The units this person may answer a pre-meeting poll for: **owners only**,
/// one answer per unit. The server sends `eligible_unit_ids` for the meeting
/// (the owner's units); the app keeps only those the person currently owns, so
/// a tenant or a household member never gets an answer button even if the
/// server list were wider.
List<MeOccupancy> pollEligibleUnits(
  MyMeeting my,
  Iterable<MeOccupancy> occupancies,
) {
  final eligible = my.eligibleUnitIds.toSet();
  final seen = <String>{};
  return [
    for (final o in occupancies)
      if (o.kind == MeOccupancyKindEnum.owner &&
          eligible.contains(o.unitId) &&
          seen.add(o.unitId))
        o,
  ];
}

enum PollPhase { notOpen, open, closed }

/// Whether the poll accepts answers at [now].
PollPhase pollPhase(Poll poll, DateTime now) {
  if (poll.status == PollStatusEnum.closed) return PollPhase.closed;
  if (poll.status != PollStatusEnum.open) return PollPhase.notOpen;
  if (now.isBefore(poll.opensAt)) return PollPhase.notOpen;
  if (now.isAfter(poll.closesAt)) return PollPhase.closed;
  return PollPhase.open;
}

/// A poll can be answered for a unit while it is open and the unit is one the
/// person may answer for (a co-owner may change the unit's answer).
bool canAnswerPoll({
  required PollPhase phase,
  required String unitId,
  required Iterable<MeOccupancy> eligible,
}) => phase == PollPhase.open && eligible.any((o) => o.unitId == unitId);

/// Meetings still to come (called or in session), soonest first.
List<Meeting> upcomingMeetings(Iterable<Meeting> all, DateTime now) {
  final list = [
    for (final m in all)
      if ((m.status == MeetingStatusEnum.called ||
              m.status == MeetingStatusEnum.inSession) &&
          (m.status == MeetingStatusEnum.inSession ||
              m.secondCallAt.isAfter(now) ||
              m.scheduledAt.isAfter(now)))
        m,
  ]..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
  return list;
}

/// Closed meetings (the record), latest first.
List<Meeting> pastMeetings(Iterable<Meeting> all, DateTime now) {
  final upcoming = {for (final m in upcomingMeetings(all, now)) m.id};
  final list = [
    for (final m in all)
      if (!upcoming.contains(m.id) &&
          m.status != MeetingStatusEnum.draft &&
          m.status != MeetingStatusEnum.cancelled)
        m,
  ]..sort((a, b) => b.scheduledAt.compareTo(a.scheduledAt));
  return list;
}

/// What the person sees of the decision history. Owners see all decisions;
/// everyone else (tenants, household members) only those marked as
/// concerning residents (G4). The server filters too; this keeps the rule
/// even if a response were wider.
List<Decision> decisionsVisibleTo(
  Iterable<Decision> all, {
  required bool isOwner,
}) {
  final list =
      [
        for (final d in all)
          if (isOwner || d.concernsResidents) d,
      ]..sort((a, b) {
        final y = b.year.compareTo(a.year);
        return y != 0 ? y : b.sequenceNo.compareTo(a.sequenceNo);
      });
  return list;
}

/// The QR payload of the owner's check-in: `attendance_qr` is what the QR
/// encodes; the bare token is only a fallback for display. `null` when the
/// meeting issued none (not an owner, or not eligible).
String? checkInQrPayload(MyMeeting my) {
  final qr = my.attendanceQr?.trim();
  if (qr != null && qr.isNotEmpty) return qr;
  return null;
}

/// True when the person owns a unit in the organization.
bool isOwnerIn(Iterable<MeOccupancy> occupancies) =>
    occupancies.any((o) => o.kind == MeOccupancyKindEnum.owner);
