import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:timezone/timezone.dart' as tz;

/// Booking rules arithmetic (mobile plan 7.1 "Bookings", decision C1). The
/// server enforces every rule; the app mirrors them so the slot picker only
/// offers what can succeed and the fee and the refund rule are shown before
/// the confirmation.

/// Why a slot cannot be booked.
enum BookingProblem {
  closed,
  tooLong,
  tooSoon,
  tooFar,
  taken,
  quotaReached,
  notAllowed,
}

/// Roles of a resident that a facility may be limited to.
enum OccupancyRole { owner, tenant, household }

/// Minutes of the day of `HH:MM` (opening hours are in the site timezone).
int minutesOfDay(String hhmm) {
  final parts = hhmm.split(':');
  return int.parse(parts[0]) * 60 + int.parse(parts[1]);
}

/// The instant of the wall-clock time [hour]:[minute] on the calendar day
/// [y]-[m]-[d] in the site timezone (hour 24 is the next midnight).
DateTime siteInstant(
  String timezone,
  int y,
  int m,
  int d, {
  int hour = 0,
  int minute = 0,
}) {
  final zone = inSiteZone(DateTime.utc(2000), timezone).location;
  return tz.TZDateTime(zone, y, m, d, hour, minute).toUtc();
}

/// A calendar day in the site timezone.
typedef SiteDay = ({int year, int month, int day});

SiteDay siteDayOf(DateTime instant, String timezone) {
  final local = inSiteZone(instant, timezone);
  return (year: local.year, month: local.month, day: local.day);
}

/// ISO weekday (1 = Monday) of a [SiteDay].
int isoWeekday(SiteDay d) => DateTime.utc(d.year, d.month, d.day).weekday;

SiteDay addDays(SiteDay d, int days) {
  final n = DateTime.utc(d.year, d.month, d.day).add(Duration(days: days));
  return (year: n.year, month: n.month, day: n.day);
}

/// Opening windows (minutes of the day) of [day].
List<({int start, int end})> openingWindows(FacilityRules rules, SiteDay day) {
  final wd = isoWeekday(day);
  return [
    for (final h in rules.openingHours)
      if (h.days.contains(wd))
        (start: minutesOfDay(h.start), end: minutesOfDay(h.end)),
  ];
}

/// The days that can be picked: today to `max_days_ahead` days ahead, in the
/// site timezone, limited to days that have opening hours.
List<SiteDay> bookableDays({
  required FacilityRules rules,
  required DateTime now,
  required String timezone,
}) {
  final today = siteDayOf(now, timezone);
  final days = <SiteDay>[];
  for (var i = 0; i <= rules.maxDaysAhead; i++) {
    final d = addDays(today, i);
    if (openingWindows(rules, d).isNotEmpty) days.add(d);
  }
  return days;
}

/// Allowed durations in minutes: steps of [step] up to the maximum.
List<int> durationChoices(FacilityRules rules, {int step = 30}) {
  final max = rules.maxDurationMinutes;
  if (max <= 0) return const [];
  return [for (var m = step; m < max; m += step) m, max];
}

/// Bookings of the unit that count against the quota of the period around
/// [start] (calendar week from Monday, or calendar month, in the site zone).
int quotaUsed({
  required Iterable<Booking> mine,
  required FacilityRules rules,
  required String facilityId,
  required String unitId,
  required DateTime start,
  required String timezone,
}) {
  final period = rules.quotaPeriod;
  if (rules.quotaPerUnit == null || period == null) return 0;
  final day = siteDayOf(start, timezone);
  bool samePeriod(DateTime other) {
    final o = siteDayOf(other, timezone);
    switch (period) {
      case FacilityRulesQuotaPeriodEnum.week:
        final a = DateTime.utc(day.year, day.month, day.day);
        final b = DateTime.utc(o.year, o.month, o.day);
        final monA = a.subtract(Duration(days: a.weekday - 1));
        final monB = b.subtract(Duration(days: b.weekday - 1));
        return monA == monB;
      case FacilityRulesQuotaPeriodEnum.month:
        return day.year == o.year && day.month == o.month;
      case FacilityRulesQuotaPeriodEnum.unknownDefaultOpenApi:
        return false;
    }
  }

  return mine
      .where(
        (b) =>
            b.status == BookingStatusEnum.confirmed &&
            b.facilityId == facilityId &&
            b.unitId == unitId &&
            samePeriod(b.start),
      )
      .length;
}

bool _overlaps(DateTime aStart, DateTime aEnd, TimeRange r) =>
    aStart.isBefore(r.end) && aEnd.isAfter(r.start);

bool _mayBook(FacilityRules rules, OccupancyRole role) {
  if (rules.whoMayBook.isEmpty) return true;
  return rules.whoMayBook.any(
    (w) => switch (w) {
      FacilityRulesWhoMayBookEnum.owner => role == OccupancyRole.owner,
      FacilityRulesWhoMayBookEnum.tenant => role == OccupancyRole.tenant,
      FacilityRulesWhoMayBookEnum.household => role == OccupancyRole.household,
      // A role this app does not know is not assumed to include the user.
      FacilityRulesWhoMayBookEnum.unknownDefaultOpenApi => false,
    },
  );
}

/// The first rule [start, end) breaks, or `null` when it can be requested.
BookingProblem? checkSlot({
  required FacilityRules rules,
  required DateTime start,
  required DateTime end,
  required DateTime now,
  required String timezone,
  Availability? availability,
  int quotaAlreadyUsed = 0,
  OccupancyRole? role,
}) {
  if (role != null && !_mayBook(rules, role)) return BookingProblem.notAllowed;
  final minutes = end.difference(start).inMinutes;
  if (minutes <= 0 || minutes > rules.maxDurationMinutes) {
    return BookingProblem.tooLong;
  }
  final day = siteDayOf(start, timezone);
  final startLocal = inSiteZone(start, timezone);
  final startMin = startLocal.hour * 60 + startLocal.minute;
  final endMin = startMin + minutes;
  final inside = openingWindows(
    rules,
    day,
  ).any((w) => startMin >= w.start && endMin <= w.end);
  if (!inside) return BookingProblem.closed;
  final notice = Duration(minutes: rules.minNoticeMinutes ?? 0);
  if (start.isBefore(now.add(notice))) return BookingProblem.tooSoon;
  final lastDay = addDays(siteDayOf(now, timezone), rules.maxDaysAhead);
  final lastInstant = siteInstant(
    timezone,
    lastDay.year,
    lastDay.month,
    lastDay.day,
    hour: 24,
  );
  if (start.isAfter(lastInstant)) return BookingProblem.tooFar;
  if (availability != null &&
      (availability.taken.any((r) => _overlaps(start, end, r)) ||
          availability.blocked.any((r) => _overlaps(start, end, r)))) {
    return BookingProblem.taken;
  }
  final quota = rules.quotaPerUnit;
  if (quota != null && quotaAlreadyUsed >= quota) {
    return BookingProblem.quotaReached;
  }
  return null;
}

/// The start times (every [step] minutes) of [day] at which a booking of
/// [duration] minutes fits the opening hours, each with the problem that
/// rules it out (`null` = free).
List<({DateTime start, BookingProblem? problem})> startTimes({
  required FacilityRules rules,
  required SiteDay day,
  required int duration,
  required DateTime now,
  required String timezone,
  Availability? availability,
  int quotaAlreadyUsed = 0,
  OccupancyRole? role,
  int step = 30,
}) {
  final out = <({DateTime start, BookingProblem? problem})>[];
  for (final w in openingWindows(rules, day)) {
    for (var m = w.start; m + duration <= w.end; m += step) {
      final start = siteInstant(
        timezone,
        day.year,
        day.month,
        day.day,
        hour: m ~/ 60,
        minute: m % 60,
      );
      final end = start.add(Duration(minutes: duration));
      out.add((
        start: start,
        problem: checkSlot(
          rules: rules,
          start: start,
          end: end,
          now: now,
          timezone: timezone,
          availability: availability,
          quotaAlreadyUsed: quotaAlreadyUsed,
          role: role,
        ),
      ));
    }
  }
  out.sort((a, b) => a.start.compareTo(b.start));
  return out;
}

/// What confirming a booking costs and what cancelling gives back; shown
/// before the confirmation. The contract has no preview endpoint: the fee is
/// the facility's flat fee (decision C1), charged when the booking is
/// confirmed and refunded when it is cancelled before the cutoff.
class BookingQuote {
  const new({
    required this.fee,
    required this.refundCutoffHours,
    required this.start,
  });

  factory fromRules(FacilityRules rules, DateTime start) {
    final fee = rules.fee;
    return BookingQuote(
      fee: (fee == null || fee.amount <= 0) ? null : fee,
      refundCutoffHours: rules.cancelRefundCutoffHours,
      start: start,
    );
  }

  /// Charged on confirmation; `null` when the booking is free.
  final Money? fee;
  final int? refundCutoffHours;
  final DateTime start;

  bool get hasFee => fee != null;

  /// Cancel before this instant to get the fee back; `null` when the fee is
  /// never refunded (no cutoff) or there is no fee.
  DateTime? get refundableUntil => !hasFee || refundCutoffHours == null
      ? null
      : start.subtract(Duration(hours: refundCutoffHours!));

  /// True when cancelling at [now] gives the fee back.
  bool refundableAt(DateTime now) {
    final until = refundableUntil;
    return until != null && !now.isAfter(until);
  }
}

/// The refund rule of an existing [booking] at [now], from the facility's
/// cutoff: its fee and whether cancelling now refunds it.
({Money? fee, bool refunded, DateTime? until}) cancelOutcome({
  required Booking booking,
  required int? cutoffHours,
  required DateTime now,
}) {
  final fee = booking.fee;
  if (fee == null || fee.amount <= 0) {
    return (fee: null, refunded: false, until: null);
  }
  final until = cutoffHours == null
      ? null
      : booking.start.subtract(Duration(hours: cutoffHours));
  return (
    fee: fee,
    refunded: until != null && !now.isAfter(until),
    until: until,
  );
}

/// Upcoming confirmed bookings first (soonest first), then the past and the
/// cancelled ones (latest first).
List<Booking> sortBookings(Iterable<Booking> items, DateTime now) {
  final upcoming = <Booking>[];
  final rest = <Booking>[];
  for (final b in items) {
    if (b.status == BookingStatusEnum.confirmed && b.end.isAfter(now)) {
      upcoming.add(b);
    } else {
      rest.add(b);
    }
  }
  upcoming.sort((a, b) => a.start.compareTo(b.start));
  rest.sort((a, b) => b.start.compareTo(a.start));
  return [...upcoming, ...rest];
}
