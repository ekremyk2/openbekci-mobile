import 'package:intl/intl.dart';
import 'package:openbekci_mobile/core/widgets/display.dart' show SiteDate;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Minor-unit digits per ISO 4217 currency; the API sends integer minor units.
int minorUnitDigits(String currency) {
  switch (currency.toUpperCase()) {
    case 'JPY':
    case 'KRW':
    case 'VND':
    case 'CLP':
    case 'ISK':
      return 0;
    case 'BHD':
    case 'KWD':
    case 'OMR':
    case 'JOD':
    case 'TND':
      return 3;
  }
  return 2;
}

/// Formats `{amount, currency}` (integer minor units) for [locale], for
/// example `₺1.234,50` for `tr`. The split into whole and fractional part is
/// done in integers; only the final display value is a number.
String formatMoney(int amountMinor, String currency, {required String locale}) {
  final digits = minorUnitDigits(currency);
  final divisor = BigInt.from(10).pow(digits);
  final abs = BigInt.from(amountMinor).abs();
  final whole = abs ~/ divisor;
  final frac = abs % divisor;
  final format = NumberFormat.currency(
    locale: locale,
    name: currency.toUpperCase(),
    decimalDigits: digits,
  );
  final value = whole.toInt() + frac.toInt() / divisor.toInt();
  return format.format(amountMinor < 0 ? -value : value);
}

bool _tzReady = false;

/// Loads the timezone database once (idempotent). Called at startup and in
/// tests before any [SiteDate] is shown.
void ensureTimeZones() {
  if (_tzReady) return;
  tzdata.initializeTimeZones();
  _tzReady = true;
}

/// Wall-clock time of [instant] in the site's IANA timezone
/// (`Europe/Istanbul`). Unknown zone names fall back to UTC.
tz.TZDateTime inSiteZone(DateTime instant, String timezone) {
  ensureTimeZones();
  return tz.TZDateTime.from(instant.toUtc(), _locationOrUtc(timezone));
}

tz.Location _locationOrUtc(String name) {
  try {
    return tz.getLocation(name);
  } on Exception {
    return tz.UTC;
  }
}

/// Formats an RFC 3339 instant as a date (optionally with time) in the
/// **site's** timezone, never the device's.
String formatSiteDate(
  DateTime instant, {
  required String timezone,
  required String locale,
  bool withTime = false,
}) {
  final local = inSiteZone(instant, timezone);
  final fmt = withTime
      ? DateFormat.yMMMd(locale).add_Hm()
      : DateFormat.yMMMd(locale);
  return fmt.format(local);
}

/// Formats a plain `YYYY-MM-DD` date. Such dates are already in the site's
/// timezone, so no conversion happens and it never shifts a day.
String formatSiteCalendarDate(String isoDate, {required String locale}) {
  final p = DateTime.tryParse(isoDate);
  if (p == null) return isoDate;
  return DateFormat.yMMMd(locale).format(DateTime(p.year, p.month, p.day));
}
