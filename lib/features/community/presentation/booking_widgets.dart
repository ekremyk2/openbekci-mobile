import 'package:intl/intl.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/features/community/domain/booking_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// `Mon-Fri` or `Mon, Wed, Sat` for ISO weekdays (1 = Monday), in [locale].
String weekdaysLabel(List<int> days, String locale) {
  final sorted = ({...days}.where((d) => d >= 1 && d <= 7).toList())..sort();
  if (sorted.isEmpty) return '';
  String name(int d) => DateFormat.E(locale)
      .format(DateTime.utc(2024, 1, d)); // 1 Jan 2024: Monday
  final parts = <String>[];
  var i = 0;
  while (i < sorted.length) {
    var j = i;
    while (j + 1 < sorted.length && sorted[j + 1] == sorted[j] + 1) {
      j++;
    }
    parts.add(
      j - i >= 2
          ? '${name(sorted[i])}–${name(sorted[j])}'
          : [for (var k = i; k <= j; k++) name(sorted[k])].join(', '),
    );
    i = j + 1;
  }
  return parts.join(', ');
}

/// `45 min`, `2 h`, `1 h 30 min`.
String durationLabel(AppLocalizations l, int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h == 0) return l.durationMinutes(m);
  if (m == 0) return l.durationHours(h);
  return l.durationHoursMinutes(h, m);
}

/// The facility's rules in plain sentences: hours, longest booking, lead time,
/// how far ahead, quota and fee. The same text the web app shows.
List<String> ruleLines(
  AppLocalizations l,
  FacilityRules rules, {
  required String locale,
}) => [
  for (final h in rules.openingHours)
    l.ruleHours(weekdaysLabel(h.days, locale), h.start, h.end),
  l.ruleMaxDuration(durationLabel(l, rules.maxDurationMinutes)),
  if ((rules.minNoticeMinutes ?? 0) > 0)
    l.ruleLeadTime(durationLabel(l, rules.minNoticeMinutes!)),
  l.ruleMaxDaysAhead(rules.maxDaysAhead),
  if (rules.quotaPerUnit != null)
    switch (rules.quotaPeriod) {
      FacilityRulesQuotaPeriodEnum.week => l.ruleQuotaWeek(rules.quotaPerUnit!),
      FacilityRulesQuotaPeriodEnum.month => l.ruleQuotaMonth(
        rules.quotaPerUnit!,
      ),
      _ => l.ruleQuotaPerUnit(rules.quotaPerUnit!),
    },
];

String bookingProblemText(AppLocalizations l, BookingProblem p) => switch (p) {
  BookingProblem.closed => l.bookingProblemClosed,
  BookingProblem.tooLong => l.bookingProblemTooLong,
  BookingProblem.tooSoon => l.bookingProblemTooSoon,
  BookingProblem.tooFar => l.bookingProblemTooFar,
  BookingProblem.taken => l.bookingProblemTaken,
  BookingProblem.quotaReached => l.bookingProblemQuota,
  BookingProblem.notAllowed => l.bookingProblemNotAllowed,
};
