import 'package:flutter/material.dart';

/// Font families bundled in `assets/fonts` (see pubspec.yaml).
const displayFont = 'BricolageGrotesque';
const sansFont = 'IBMPlexSans';
const monoFont = 'IBMPlexMono';

/// Radii of the brand: badges and checkboxes, controls, cards and dialogs.
const radiusSm = 4.0;
const radiusMd = 8.0;
const radiusLg = 12.0;

/// The Kiremit terracotta tile in the light theme; a `seed` equal to this
/// means "no instance override" (also under the Taş look).
const brandTile = Color(0xFFBD4E27);

/// The two selectable looks: Kiremit (the brand) and Taş.
enum Look { kiremit, tas }

/// Brand color tokens (`tokens.json` of the brand book) for one theme.
class BrandTokens {
  const new({
    required this.surface,
    required this.raised,
    required this.sunken,
    required this.line,
    required this.lineStrong,
    required this.ink,
    required this.inkMuted,
    required this.night,
    required this.onNight,
    required this.tile,
    required this.tileDeep,
    required this.tileTint,
    required this.onTile,
    required this.shadowInk,
    required this.success,
    required this.successTint,
    required this.warning,
    required this.warningTint,
    required this.danger,
    required this.dangerTint,
    required this.info,
    required this.infoTint,
    required this.focus,
  });

  final Color surface;
  final Color raised;
  final Color sunken;
  final Color line;
  final Color lineStrong;
  final Color ink;
  final Color inkMuted;
  final Color night;
  final Color onNight;
  final Color tile;
  final Color tileDeep;
  final Color tileTint;
  final Color onTile;
  final Color shadowInk;
  final Color success;
  final Color successTint;
  final Color warning;
  final Color warningTint;
  final Color danger;
  final Color dangerTint;
  final Color info;
  final Color infoTint;
  final Color focus;
}

const lightTokens = BrandTokens(
  surface: Color(0xFFFBF6F0),
  raised: Color(0xFFFFFDFA),
  sunken: Color(0xFFF4EBE1),
  line: Color(0xFFE6D9CB),
  lineStrong: Color(0xFF8C7A69),
  ink: Color(0xFF1A2433),
  inkMuted: Color(0xFF4F5A6A),
  night: Color(0xFF14284A),
  onNight: Color(0xFFFBF4EA),
  tile: Color(0xFFBD4E27),
  tileDeep: Color(0xFF963718),
  tileTint: Color(0xFFFFE3D2),
  onTile: Color(0xFFFFFAF4),
  shadowInk: Color(0xFF07101F),
  success: Color(0xFF17744A),
  successTint: Color(0xFFD3F5DF),
  warning: Color(0xFF8F5B00),
  warningTint: Color(0xFFFFECBD),
  danger: Color(0xFFB4123A),
  dangerTint: Color(0xFFFFE1E1),
  info: Color(0xFF1B62A8),
  infoTint: Color(0xFFDCEDFF),
  focus: Color(0xFF153F87),
);

const darkTokens = BrandTokens(
  surface: Color(0xFF181513),
  raised: Color(0xFF211D1A),
  sunken: Color(0xFF110F0D),
  line: Color(0xFF35302B),
  lineStrong: Color(0xFF7F756C),
  ink: Color(0xFFF3EDE6),
  inkMuted: Color(0xFFB0A69C),
  night: Color(0xFFBCD0EE),
  onNight: Color(0xFF0A1730),
  tile: Color(0xFFEE8A62),
  tileDeep: Color(0xFFF6A98A),
  tileTint: Color(0xFF3B2118),
  onTile: Color(0xFF1B0F0A),
  shadowInk: Color(0xFF060403),
  success: Color(0xFF7AD68F),
  successTint: Color(0xFF12301F),
  warning: Color(0xFFF0BD4C),
  warningTint: Color(0xFF3A2A0C),
  danger: Color(0xFFFF8083),
  dangerTint: Color(0xFF4A2022),
  info: Color(0xFF8CC2F2),
  infoTint: Color(0xFF1A2D40),
  focus: Color(0xFF9CCBFF),
);

const tasLightTokens = BrandTokens(
  surface: Color(0xFFF6F5F3),
  raised: Color(0xFFFDFCFB),
  sunken: Color(0xFFEDEBE8),
  line: Color(0xFFDAD7D2),
  lineStrong: Color(0xFF85807A),
  ink: Color(0xFF1C1D20),
  inkMuted: Color(0xFF55575C),
  night: Color(0xFF232B36),
  onNight: Color(0xFFF6F5F3),
  tile: Color(0xFFA8573E),
  tileDeep: Color(0xFF874330),
  tileTint: Color(0xFFF1E4DE),
  onTile: Color(0xFFFBF9F7),
  shadowInk: Color(0xFF0A0C10),
  success: Color(0xFF1A7449),
  successTint: Color(0xFFD5F2E1),
  warning: Color(0xFF946000),
  warningTint: Color(0xFFFFF0C9),
  danger: Color(0xFFC0143C),
  dangerTint: Color(0xFFFFE0E3),
  info: Color(0xFF1F6AA5),
  infoTint: Color(0xFFDCECFB),
  focus: Color(0xFF1F4F8F),
);

const tasDarkTokens = BrandTokens(
  surface: Color(0xFF1E1D1B),
  raised: Color(0xFF272624),
  sunken: Color(0xFF171614),
  line: Color(0xFF3A3835),
  lineStrong: Color(0xFF7B7873),
  ink: Color(0xFFF1EFEC),
  inkMuted: Color(0xFFB1AEA9),
  night: Color(0xFFD3D8DE),
  onNight: Color(0xFF14171C),
  tile: Color(0xFFDC9378),
  tileDeep: Color(0xFFE8AB94),
  tileTint: Color(0xFF372A25),
  onTile: Color(0xFF1A1210),
  shadowInk: Color(0xFF080706),
  success: Color(0xFF6FD29A),
  successTint: Color(0xFF12301F),
  warning: Color(0xFFF0BD4C),
  warningTint: Color(0xFF3A2A0C),
  danger: Color(0xFFFF8587),
  dangerTint: Color(0xFF4A2022),
  info: Color(0xFF8CC2F2),
  infoTint: Color(0xFF1A2D40),
  focus: Color(0xFF8CC3FC),
);

/// Status and focus colors the Material [ColorScheme] has no slot for.
@immutable
class BrandColors extends ThemeExtension<BrandColors> {
  const new(this.tokens);

  final BrandTokens tokens;

  @override
  BrandColors copyWith() => this;

  @override
  BrandColors lerp(BrandColors? other, double t) => t < 0.5 ? this : other!;
}

extension BrandTheme on BuildContext {
  BrandTokens get brand => Theme.of(this).extension<BrandColors>()!.tokens;
}

TextStyle _s(
  String family,
  double size,
  double height,
  FontWeight weight, {
  double spacing = 0,
}) => TextStyle(
  fontFamily: family,
  fontSize: size,
  height: height / size,
  fontWeight: weight,
  letterSpacing: spacing,
);

/// Display and titles in Bricolage Grotesque, body and labels in IBM Plex Sans.
TextTheme _textTheme(Color ink) {
  const w5 = FontWeight.w500;
  const w6 = FontWeight.w600;
  return TextTheme(
    displayLarge: _s(displayFont, 36, 40, w6, spacing: -0.54),
    displayMedium: _s(displayFont, 32, 36, w6, spacing: -0.48),
    displaySmall: _s(displayFont, 28, 34, w6, spacing: -0.28),
    headlineLarge: _s(displayFont, 28, 34, w6, spacing: -0.28),
    headlineMedium: _s(displayFont, 24, 30, w6, spacing: -0.24),
    headlineSmall: _s(displayFont, 20, 26, w6),
    titleLarge: _s(displayFont, 18, 24, w6),
    titleMedium: _s(sansFont, 15, 22, w6),
    titleSmall: _s(sansFont, 14, 20, w5),
    bodyLarge: _s(sansFont, 15, 22, FontWeight.w400),
    bodyMedium: _s(sansFont, 14, 20, FontWeight.w400),
    bodySmall: _s(sansFont, 13, 18, FontWeight.w400),
    labelLarge: _s(sansFont, 14, 20, w5),
    labelMedium: _s(sansFont, 13, 18, w5),
    labelSmall: _s(sansFont, 13, 18, w5),
  ).apply(bodyColor: ink, displayColor: ink);
}

ColorScheme _scheme(BrandTokens t, Brightness b, Color tile) => ColorScheme(
  brightness: b,
  primary: tile,
  onPrimary: t.onTile,
  primaryContainer: t.tileTint,
  onPrimaryContainer: t.ink,
  secondary: t.night,
  onSecondary: t.onNight,
  secondaryContainer: t.sunken,
  onSecondaryContainer: t.ink,
  tertiary: t.info,
  onTertiary: t.onTile,
  tertiaryContainer: t.infoTint,
  onTertiaryContainer: t.info,
  error: t.danger,
  onError: t.onTile,
  errorContainer: t.dangerTint,
  onErrorContainer: t.danger,
  surface: t.surface,
  onSurface: t.ink,
  onSurfaceVariant: t.inkMuted,
  outline: t.lineStrong,
  outlineVariant: t.line,
  shadow: t.shadowInk,
  scrim: t.shadowInk,
  inverseSurface: t.night,
  onInverseSurface: t.onNight,
  inversePrimary: t.tileDeep,
  surfaceTint: Colors.transparent,
  surfaceDim: t.sunken,
  surfaceBright: t.raised,
  surfaceContainerLowest: t.raised,
  surfaceContainerLow: t.raised,
  surfaceContainer: t.raised,
  surfaceContainerHigh: t.raised,
  surfaceContainerHighest: t.sunken,
);

/// Material 3 theme from the OpenBekci brand tokens, every color role set
/// explicitly. [seed] is an instance's own primary color (white-label); the
/// default [brandTile] uses the brand tile of each theme.
ThemeData buildTheme({
  required Color seed,
  required Brightness brightness,
  Look look = Look.kiremit,
}) {
  final dark = brightness == Brightness.dark;
  final t = look == Look.tas
      ? (dark ? tasDarkTokens : tasLightTokens)
      : (dark ? darkTokens : lightTokens);
  final tile = seed == brandTile ? t.tile : seed;
  final text = _textTheme(t.ink);
  final hairline = BorderSide(color: t.line);
  RoundedRectangleBorder shape(double r, [BorderSide side = BorderSide.none]) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(r),
        side: side,
      );
  OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radiusMd),
    borderSide: BorderSide(color: c, width: w),
  );
  const minSize = Size.fromHeight(48);
  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: _scheme(t, brightness, tile),
    scaffoldBackgroundColor: t.surface,
    canvasColor: t.surface,
    textTheme: text,
    primaryTextTheme: text,
    visualDensity: VisualDensity.standard,
    extensions: [BrandColors(t)],
    focusColor: t.tileTint,
    hoverColor: t.tileTint,
    dividerColor: t.line,
    dividerTheme: DividerThemeData(color: t.line, thickness: 1, space: 1),
    appBarTheme: AppBarTheme(
      backgroundColor: t.surface,
      foregroundColor: t.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: text.titleLarge,
    ),
    cardTheme: CardThemeData(
      color: t.raised,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: shape(radiusLg, hairline),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: t.raised,
      surfaceTintColor: Colors.transparent,
      elevation: 6,
      shape: shape(radiusLg),
      titleTextStyle: text.headlineMedium,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: t.raised,
      surfaceTintColor: Colors.transparent,
      elevation: 3,
      shape: shape(radiusMd, hairline),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(t.raised),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        elevation: const WidgetStatePropertyAll(3),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: t.raised,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radiusLg)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      shape: shape(radiusMd),
      behavior: SnackBarBehavior.floating,
      elevation: 3,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: border(t.lineStrong),
      enabledBorder: border(t.lineStrong),
      focusedBorder: border(t.focus, 2),
      errorBorder: border(t.danger),
      focusedErrorBorder: border(t.danger, 2),
      disabledBorder: border(t.line),
      hintStyle: TextStyle(color: t.inkMuted),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: minSize,
        backgroundColor: tile,
        foregroundColor: t.onTile,
        shape: shape(radiusMd),
        textStyle: text.labelLarge,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: tile,
        foregroundColor: t.onTile,
        shape: shape(radiusMd),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: minSize,
        foregroundColor: t.ink,
        side: BorderSide(color: t.lineStrong),
        shape: shape(radiusMd),
        textStyle: text.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: tile,
        shape: shape(radiusMd),
        textStyle: text.labelLarge,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: t.raised,
      selectedColor: t.tileTint,
      side: hairline,
      shape: shape(radiusMd),
      labelStyle: text.labelLarge,
      checkmarkColor: t.ink,
      elevation: 0,
      pressElevation: 0,
    ),
    listTileTheme: ListTileThemeData(
      selectedTileColor: t.tileTint,
      selectedColor: t.ink,
      shape: shape(radiusMd),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: t.raised,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      indicatorColor: t.tileTint,
      labelTextStyle: WidgetStatePropertyAll(text.labelMedium),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: tile,
      labelColor: t.ink,
      unselectedLabelColor: t.inkMuted,
      dividerColor: t.line,
    ),
    badgeTheme: BadgeThemeData(backgroundColor: t.danger, textColor: t.onTile),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: tile),
  );
}
