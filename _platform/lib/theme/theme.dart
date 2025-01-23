import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279987025),
      surfaceTint: Color(4279987025),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289131217),
      onPrimaryContainer: Color(4278210875),
      secondary: Color(4283196248),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291815898),
      onSecondaryContainer: Color(4281682753),
      tertiary: Color(4282278772),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290963709),
      onTertiaryContainer: Color(4280634204),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4287823882),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      onSurfaceVariant: Color(4282403140),
      outline: Color(4285561204),
      outlineVariant: Color(4290759106),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4287354550),
      primaryFixed: Color(4289131217),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4287354550),
      onPrimaryFixedVariant: Color(4278210875),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290963709),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4280634204),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278206253),
      surfaceTint: Color(4279987025),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281236063),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280564529),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284183143),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279384650),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283265668),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285792262),
      onError: Color(4294967295),
      errorContainer: Color(4291767335),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310901),
      onSurface: Color(4279046672),
      onSurfaceVariant: Color(4281284659),
      outline: Color(4283127119),
      outlineVariant: Color(4284903274),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4287354550),
      primaryFixed: Color(4281236063),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278870343),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284183143),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282604111),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283265668),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281620842),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4290955459),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293192420),
      surfaceContainerHigh: Color(4292402905),
      surfaceContainerHighest: Color(4291679182),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278203172),
      surfaceTint: Color(4279987025),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278211645),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279906343),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281814596),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278399040),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280831582),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284481540),
      onError: Color(4294967295),
      errorContainer: Color(4288151562),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310901),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4278190080),
      outline: Color(4280626730),
      outlineVariant: Color(4282534726),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4287354550),
      primaryFixed: Color(4278211645),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278205226),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281814596),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280366894),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280831582),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279056199),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4290034357),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293718765),
      surfaceContainer: Color(4292797663),
      surfaceContainerHigh: Color(4291876561),
      surfaceContainerHighest: Color(4290955459),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287354550),
      surfaceTint: Color(4287354550),
      onPrimary: Color(4278204456),
      primaryContainer: Color(4278210875),
      onPrimaryContainer: Color(4289131217),
      secondary: Color(4289973439),
      onSecondary: Color(4280235307),
      secondaryContainer: Color(4281682753),
      onSecondaryContainer: Color(4291815898),
      tertiary: Color(4289121504),
      onTertiary: Color(4278793540),
      tertiaryContainer: Color(4280634204),
      onTertiaryContainer: Color(4290963709),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178514),
      onSurface: Color(4292797663),
      onSurfaceVariant: Color(4290759106),
      outline: Color(4287206285),
      outlineVariant: Color(4282403140),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inversePrimary: Color(4279987025),
      primaryFixed: Color(4289131217),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4287354550),
      onPrimaryFixedVariant: Color(4278210875),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290963709),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4280634204),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281613111),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288736459),
      surfaceTint: Color(4287354550),
      onPrimary: Color(4278201374),
      primaryContainer: Color(4283801217),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291355348),
      onSecondary: Color(4279511585),
      secondaryContainer: Color(4286486154),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290568950),
      onTertiary: Color(4278200632),
      tertiaryContainer: Color(4285634216),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294955724),
      onError: Color(4283695107),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178514),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4292206552),
      outline: Color(4289442990),
      outlineVariant: Color(4287206285),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inversePrimary: Color(4278211388),
      primaryFixed: Color(4289131217),
      onPrimaryFixed: Color(4278195469),
      primaryFixedDim: Color(4287354550),
      onPrimaryFixedVariant: Color(4278206253),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278261005),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4280564529),
      tertiaryFixed: Color(4290963709),
      onTertiaryFixed: Color(4278194972),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4279384650),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4282402370),
      surfaceContainerLowest: Color(4278454278),
      surfaceContainerLow: Color(4279836444),
      surfaceContainer: Color(4280494374),
      surfaceContainerHigh: Color(4281218097),
      surfaceContainerHighest: Color(4281941819),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290314207),
      surfaceTint: Color(4287354550),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287091378),
      onPrimaryContainer: Color(4278193672),
      secondary: Color(4292671208),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289710267),
      onSecondaryContainer: Color(4278193672),
      tertiary: Color(4292867071),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288858332),
      onTertiaryContainer: Color(4278193428),
      error: Color(4294962409),
      onError: Color(4278190080),
      errorContainer: Color(4294946468),
      onErrorContainer: Color(4280418305),
      surface: Color(4279178514),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294967295),
      outline: Color(4293522155),
      outlineVariant: Color(4290495934),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inversePrimary: Color(4278211388),
      primaryFixed: Color(4289131217),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287354550),
      onPrimaryFixedVariant: Color(4278195469),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4278261005),
      tertiaryFixed: Color(4290963709),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4278194972),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4283126094),
      surfaceContainerLowest: Color(4278190080),
      surfaceContainerLow: Color(4279968030),
      surfaceContainer: Color(4281086510),
      surfaceContainerHigh: Color(4281810233),
      surfaceContainerHighest: Color(4282533956),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
