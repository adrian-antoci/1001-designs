import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e5ce5),
      surfaceTint: Color(0xffffffff),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff0f0f5),
      onPrimaryContainer: Color(0xff4a4a4a),
      secondary: Color(0xff7a7a7a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff0f0f0),
      onSecondaryContainer: Color(0xff6a6a6a),
      tertiary: Color(0xff9a9a9a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff2f2f2),
      onTertiaryContainer: Color(0xff8a8a8a),
      error: Color(0xffc52b2b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7f7f7),
      onSurface: Color(0xff1c1c1e),
      onSurfaceVariant: Color(0xff8a8a8e),
      outline: Color(0xffd1d1d6),
      outlineVariant: Color(0xffe5e5ea),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff1c1c1e),
      inversePrimary: Color(0xffb0b0ff),
      primaryFixed: Color(0xffe2e0ff),
      onPrimaryFixed: Color(0xff00006e),
      primaryFixedDim: Color(0xffc4c7ff),
      onPrimaryFixedVariant: Color(0xff3b4093),
      secondaryFixed: Color(0xffe3e1f9),
      onSecondaryFixed: Color(0xff1a1b2b),
      secondaryFixedDim: Color(0xffc7c5dd),
      onSecondaryFixedVariant: Color(0xff454659),
      tertiaryFixed: Color(0xffffd9e2),
      onTertiaryFixed: Color(0xff301120),
      tertiaryFixedDim: Color(0xffefb8c8),
      onTertiaryFixedVariant: Color(0xff5f3c49),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f7f7),
      surfaceContainer: Color(0xfff0f0f0),
      surfaceContainerHigh: Color(0xffebebeb),
      surfaceContainerHighest: Color(0xffe5e5e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff5e5ce5),
      surfaceTint: Color(0xff1c1c1e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2c2c2f),
      onPrimaryContainer: Color(0xffe8e8e8),
      secondary: Color(0xff8a8a8e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3a3a3c),
      onSecondaryContainer: Color(0xffe8e8e8),
      tertiary: Color(0xffa8a8af),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4a4a4c),
      onTertiaryContainer: Color(0xffe8e8e8),
      error: Color(0xffff6b6b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121212),
      onSurface: Color(0xfff2f2f2),
      onSurfaceVariant: Color(0xff8a8a8e),
      outline: Color(0xff4a4a4c),
      outlineVariant: Color(0xff2c2c2f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1ea),
      inversePrimary: Color(0xff5458ac),
      primaryFixed: Color(0xffe2e0ff),
      onPrimaryFixed: Color(0xff00006e),
      primaryFixedDim: Color(0xffc4c7ff),
      onPrimaryFixedVariant: Color(0xff3b4093),
      secondaryFixed: Color(0xffe3e1f9),
      onSecondaryFixed: Color(0xff1a1b2b),
      secondaryFixedDim: Color(0xffc7c5dd),
      onSecondaryFixedVariant: Color(0xff454659),
      tertiaryFixed: Color(0xffffd9e2),
      onTertiaryFixed: Color(0xff301120),
      tertiaryFixedDim: Color(0xffefb8c8),
      onTertiaryFixedVariant: Color(0xff5f3c49),
      surfaceDim: Color(0xff1c1c1e),
      surfaceBright: Color(0xff3a3841),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1c1e),
      surfaceContainer: Color(0xff202022),
      surfaceContainerHigh: Color(0xff2a2a2d),
      surfaceContainerHighest: Color(0xff363638),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) {
    final textTheme = GoogleFonts.interTextTheme(
      ThemeData(brightness: colorScheme.brightness).textTheme,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
    );
  }
}
