import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/app/theme/theme.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// A pseudo `ar` locale for RTL layout goldens (mobile plan section 11):
/// Material and Widgets localizations are the real Arabic ones (so the text
/// direction is right-to-left), the app strings are the English ones. The app
/// ships no Arabic translation yet; this stub only proves the layout mirrors.
class EnglishAsArabicDelegate extends LocalizationsDelegate<AppLocalizations> {
  const new();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ar';

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.delegate.load(const Locale('en'));

  @override
  bool shouldReload(EnglishAsArabicDelegate old) => false;
}

/// One column of a golden grid.
class Variant {
  const new(this.name, {required this.locale, required this.brightness});

  final String name;
  final Locale locale;
  final Brightness brightness;

  bool get isRtl => locale.languageCode == 'ar';
}

const lightEn = Variant(
  'en light',
  locale: Locale('en'),
  brightness: Brightness.light,
);
const darkEn = Variant(
  'en dark',
  locale: Locale('en'),
  brightness: Brightness.dark,
);
const lightTr = Variant(
  'tr light',
  locale: Locale('tr'),
  brightness: Brightness.light,
);
const rtlAr = Variant(
  'ar rtl',
  locale: Locale('ar'),
  brightness: Brightness.light,
);

/// The default matrix: light and dark, Turkish, and RTL.
const defaultVariants = [lightEn, darkEn, lightTr, rtlAr];

const _cellSize = Size(360, 720);

/// Renders [screen] once per [variants] side by side and compares the result
/// with `goldens/<name>.png`. Fonts are the test font (Ahem), so the images are
/// the same on every platform.
Future<void> expectGolden(
  WidgetTester tester,
  String name, {
  required Widget Function() screen,
  List<Override> Function(Variant variant)? overrides,
  List<Variant> variants = defaultVariants,
  double textScale = 1,
  Future<void> Function(WidgetTester tester)? interact,
}) async {
  final width = _cellSize.width * variants.length;
  tester.view
    ..physicalSize = Size(width, _cellSize.height)
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final key = GlobalKey();
  await tester.pumpWidget(
    RepaintBoundary(
      key: key,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            for (final v in variants)
              SizedBox(
                width: _cellSize.width,
                height: _cellSize.height,
                child: ProviderScope(
                  overrides: overrides?.call(v) ?? const [],
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    locale: v.locale,
                    supportedLocales: [v.locale],
                    localizationsDelegates: [
                      if (v.isRtl)
                        const EnglishAsArabicDelegate()
                      else
                        AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    theme:
                        buildTheme(
                          seed: const Color(0xFFB75131),
                          brightness: v.brightness,
                        ).copyWith(
                          // Flat: elevation shadows are the usual source of
                          // cross-platform pixel noise.
                          splashFactory: NoSplash.splashFactory,
                        ),
                    builder: (context, child) => MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(textScale)),
                      child: child!,
                    ),
                    home: screen(),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  if (interact != null) {
    await interact(tester);
    await tester.pumpAndSettle();
  }
  await expectLater(find.byKey(key), matchesGoldenFile('goldens/$name.png'));
  // Tear down so timers owned by screens are cancelled.
  await tester.pumpWidget(const SizedBox());
}

/// Lets goldens differ by a tiny fraction of pixels (anti-aliasing differences
/// between platforms), but never silently accepts a layout change.
class TolerantGoldenComparator extends LocalFileComparator {
  new(super.testFile, {this.tolerance = 0.002});

  final double tolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );
    if (!result.passed && result.diffPercent <= tolerance) {
      return true;
    }
    if (!result.passed) {
      final error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    result.dispose();
    return true;
  }
}
