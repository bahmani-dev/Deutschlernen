import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeType { dark, light }

class AppThemes {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(AppConstant.primaryColor),
    onPrimary: Colors.black,
    secondary: Color(AppConstant.secondaryColor),
    onSecondary: Colors.white,
    error: Color(AppConstant.errorColor),
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xff1a1c1),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff8be955),
    onPrimary: Color(0xff173800),
    secondary: Color(AppConstant.darkSecondary),
    onSecondary: Color(0xff003352),
    error: Color(0xff690005),
    onError: Color(0xff93000a),
    surface: Color(0xff1a1c1e),
    onSurface: Color(0xffe2e2e6),
  );

  static TextTheme getTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 1.12,
        letterSpacing: -0.25,
        color: colorScheme.onSurface,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
        color: colorScheme.onSurface,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
        color: colorScheme.onSurface,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
        color: colorScheme.onSurface,
      ),
    );
  }

  // static ThemeData getTheme({ThemeType type = ThemeType.light}) {
  //   ColorScheme colorScheme;
  //   switch (type) {
  //     case ThemeType.light:
  //       colorScheme = lightColorScheme;
  //       break;
  //     case ThemeType.dark:
  //       colorScheme = darkColorScheme;
  //       break;
  //   }

  // }
}
