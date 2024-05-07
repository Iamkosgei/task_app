import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taks_app/core/ui/app_colors.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.robotoTextTheme(
      baseTheme.textTheme,
    ).copyWith(
      titleLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w100,
        color: Colors.white,
      ),
    ),
  );
}
