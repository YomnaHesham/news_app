// import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color navy = Color(0xFF4F5A69);
  static const Color black = Color(0xFF303030);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF79828B);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: white, size: 32),
      backgroundColor: primary,
      foregroundColor: white,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: navy,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleMedium: GoogleFonts.exo(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      titleSmall:  GoogleFonts.inder(
        color: primary,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: navy,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.poppins(
        color: gray,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
    ),
  );
}
