import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tokens.dart';

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);

  final textTheme = GoogleFonts.interTextTheme(base.textTheme).copyWith(
    displaySmall: GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.w600, height: 28 / 24),
    titleMedium: GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, height: 24 / 20),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, height: 22 / 16),
    bodySmall: GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w400, height: 18 / 13),
  );

  return base.copyWith(
    scaffoldBackgroundColor: Tokens.bg900,
    colorScheme: base.colorScheme.copyWith(
      primary: Tokens.brand500,
      secondary: Tokens.brand600,
      surface: Tokens.bg800,
      onPrimary: Tokens.text100,
      onSurface: Tokens.text100,
    ),
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Tokens.bg900,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.titleMedium?.copyWith(color: Tokens.text100),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Tokens.brand500,
        foregroundColor: Tokens.text100,
        textStyle:
            textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(
            vertical: Tokens.s12, horizontal: Tokens.s24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Tokens.r16)),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Tokens.bg800,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: Tokens.s16, vertical: Tokens.s12),
      hintStyle: textTheme.bodySmall?.copyWith(color: Tokens.text500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Tokens.r8),
        borderSide: const BorderSide(color: Tokens.bg800),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Tokens.r8),
        borderSide: const BorderSide(color: Tokens.bg800),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Tokens.r8),
        borderSide: const BorderSide(color: Tokens.brand500, width: 2),
      ),
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: Tokens.bg800,
      labelStyle: const TextStyle(color: Tokens.text300),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Tokens.r8)),
    ),
    cardTheme: CardThemeData(
      color: Tokens.bg800,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Tokens.r16),
      ),
      margin: EdgeInsets.zero,
    ),
  );
}
