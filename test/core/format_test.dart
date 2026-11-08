import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';

void main() {
  setUpAll(() async {
    ensureTimeZones();
    await initializeDateFormatting();
  });

  group('formatMoney', () {
    test('TRY in tr and en', () {
      expect(formatMoney(123450, 'TRY', locale: 'tr'), contains('1.234,50'));
      expect(formatMoney(123450, 'TRY', locale: 'en'), contains('1,234.50'));
    });

    test('zero-decimal and three-decimal currencies', () {
      expect(formatMoney(1500, 'JPY', locale: 'en'), contains('1,500'));
      expect(formatMoney(1500, 'KWD', locale: 'en'), contains('1.500'));
      expect(minorUnitDigits('try'), 2);
    });

    test('negative amounts and small amounts keep their cents', () {
      expect(formatMoney(-5, 'TRY', locale: 'en'), contains('-'));
      expect(formatMoney(-5, 'TRY', locale: 'en'), contains('0.05'));
      expect(formatMoney(0, 'TRY', locale: 'en'), contains('0.00'));
    });
  });

  group('site dates', () {
    test('shows the date in the site timezone, not UTC', () {
      // 21:30 UTC on 30 Nov is already 1 Dec in Istanbul (UTC+3).
      final instant = DateTime.utc(2026, 11, 30, 21, 30);
      expect(
        formatSiteDate(instant, timezone: 'Europe/Istanbul', locale: 'en'),
        contains('Dec 1, 2026'),
      );
      expect(
        formatSiteDate(instant, timezone: 'UTC', locale: 'en'),
        contains('Nov 30, 2026'),
      );
    });

    test('with time', () {
      final instant = DateTime.utc(2026, 7, 1, 12);
      expect(
        formatSiteDate(
          instant,
          timezone: 'America/New_York',
          locale: 'en',
          withTime: true,
        ),
        contains('08:00'),
      );
    });

    test('unknown zone falls back to UTC instead of throwing', () {
      expect(
        formatSiteDate(
          DateTime.utc(2026, 1, 1, 23),
          timezone: 'Nowhere/Land',
          locale: 'en',
        ),
        contains('Jan 1, 2026'),
      );
    });

    test('a plain date never shifts', () {
      expect(
        formatSiteCalendarDate('2026-03-01', locale: 'en'),
        contains('Mar 1, 2026'),
      );
      expect(formatSiteCalendarDate('garbage', locale: 'en'), 'garbage');
    });
  });
}
