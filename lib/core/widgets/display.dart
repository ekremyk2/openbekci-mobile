import 'package:flutter/material.dart';
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
    return Text(
      formatMoney(amountMinor, currency, locale: locale),
      style: style,
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
