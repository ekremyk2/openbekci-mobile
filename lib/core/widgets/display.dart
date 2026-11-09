import 'package:flutter/material.dart';
import 'package:openbekci_mobile/app/theme/theme.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';

/// An amount of money (integer minor units) in the site's currency, formatted
/// for the user's locale. The only way money is shown (mobile plan section 11).
class MoneyText extends StatelessWidget {
  const new({
    required this.amountMinor,
    required this.currency,
    this.style,
    super.key,
  });

  final int amountMinor;
  final String currency;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    // True minus sign (U+2212), not the hyphen.
    final text = formatMoney(
      amountMinor,
      currency,
      locale: locale,
    ).replaceFirst('-', '−');
    return Text(
      text,
      // Plex Mono with tabular figures: columns align digit for digit.
      style: (style ?? const TextStyle()).copyWith(
        fontFamily: monoFont,
        fontWeight: FontWeight.w500,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
      // Digits and symbols keep their order inside right-to-left text.
      textDirection: TextDirection.ltr,
    );
  }
}

/// A date shown in the **site's** timezone (never `DateTime.now()` of the
/// device), from an RFC 3339 instant or a plain `YYYY-MM-DD` date.
class SiteDate extends StatelessWidget {
  const new({
    required this.timezone,
    this.instant,
    this.isoDate,
    this.withTime = false,
    this.style,
    super.key,
  }) : assert(
         (instant == null) != (isoDate == null),
         'give either an instant or an isoDate',
       );

  final DateTime? instant;
  final String? isoDate;
  final String timezone;
  final bool withTime;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final text = instant != null
        ? formatSiteDate(
            instant!,
            timezone: timezone,
            locale: locale,
            withTime: withTime,
          )
        : formatSiteCalendarDate(isoDate!, locale: locale);
    return Text(text, style: style);
  }
}

/// A grey placeholder bar for loading states.
class SkeletonBox extends StatelessWidget {
  const new({this.width, this.height = 16, super.key});

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

/// A list of [SkeletonBox] rows while a screen loads.
class SkeletonList extends StatelessWidget {
  const new({this.rows = 4, super.key});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < rows; i++) ...const [
            SkeletonBox(width: 180),
            SizedBox(height: 8),
            SkeletonBox(),
            SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}

/// A range of instants in the site's timezone (`Nov 21, 2026, 14:00 - 16:00`).
class SiteRange extends StatelessWidget {
  const new({
    required this.start,
    required this.end,
    required this.timezone,
    this.style,
    super.key,
  });

  final DateTime start;
  final DateTime end;
  final String timezone;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    return Text(
      formatSiteRange(start, end, timezone: timezone, locale: locale),
      style: style,
    );
  }
}

/// Tone of a [StatusBadge].
enum StatusTone { success, warning, danger, info }

/// A status as a tinted pill with text (never hue alone).
class StatusBadge extends StatelessWidget {
  const new(this.label, this.tone, {super.key});

  final String label;
  final StatusTone tone;

  @override
  Widget build(BuildContext context) {
    final b = context.brand;
    final (fg, bg) = switch (tone) {
      StatusTone.success => (b.success, b.successTint),
      StatusTone.warning => (b.warning, b.warningTint),
      StatusTone.danger => (b.danger, b.dangerTint),
      StatusTone.info => (b.info, b.infoTint),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radiusSm),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg),
        ),
      ),
    );
  }
}

/// The brand mark or wordmark for the current theme (PNG renders of the
/// brand SVGs in `assets/brand`).
class BrandLogo extends StatelessWidget {
  const new({required this.height, this.wordmark = false, super.key});

  final double height;
  final bool wordmark;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(
      'assets/brand/${wordmark ? 'wordmark' : 'mark'}${dark ? '_dark' : ''}.png',
      height: height,
      excludeFromSemantics: !wordmark,
      semanticLabel: wordmark ? 'OpenBekci' : null,
    );
  }
}
