import 'package:flutter/material.dart';
import 'package:myapp/utils/extensions/build_context_extension.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF7FAFC),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      primarySwatch: Colors.blue,
      primaryColor: const Color(0xFF0B1875),
      primaryColorLight: const Color(0xFF262B4F),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: context.labelSmall!.copyWith(color: Colors.white),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFF0B1875),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )),
    );
  }
}
