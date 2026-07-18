import 'package:flutter/material.dart';

class ThemeMain {
  // Exact primary color from the image (a solid vibrant purple)
  static const Color primaryColor = Color(0xff7358F5);
  static const Color greyBackground = Color(0xffF8F8F8);
  static const Color greyBorder = Color(0xffE8E8E8);
  static const Color greyText = Color(0xff9E9E9E);
  static const Color errorColor = Color(0xffFF3F3F);

  static ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'BonyadeKoodak',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          error: errorColor,
          primary: primaryColor,
          surface: Colors.white,
          onSurface: Colors.black,
          outline: greyBorder,
          surfaceContainerHighest: greyBackground,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: greyText,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: greyBackground,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffCCCCCC)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: greyBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: greyBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor, width: 1.5),
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            minimumSize: const Size(double.infinity, 52),
            side: const BorderSide(color: greyBorder),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
    );
  }


}
