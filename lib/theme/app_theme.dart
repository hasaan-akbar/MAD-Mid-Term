import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Palette
  static const Color navy = Color(0xFF17324D);
  static const Color teal = Color(0xFF2F7C78);
  static const Color offWhite = Color(0xFFF7F6F2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF263238);
  static const Color textMuted = Color(0xFF687580);

  // Neutral helpers derived from the palette (borders / light teal fill)
  static const Color border = Color(0xFFE3E1DA);
  static const Color tealTint = Color(0xFFE4F0EE);

  // Text styles
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: navy,
    height: 1.2,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: textDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: textDark,
    height: 1.45,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 13,
    color: textMuted,
    height: 1.35,
  );

  static OutlineInputBorder _inputBorder(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static ThemeData get light {
    const scheme = ColorScheme.light(
      primary: navy,
      onPrimary: white,
      secondary: teal,
      onSecondary: white,
      surface: white,
      onSurface: textDark,
      error: Color(0xFFB3261E),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: offWhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: navy,
        foregroundColor: white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: navy,
          foregroundColor: white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: _inputBorder(border),
        enabledBorder: _inputBorder(border),
        focusedBorder: _inputBorder(teal, 1.5),
        errorBorder: _inputBorder(scheme.error),
        focusedErrorBorder: _inputBorder(scheme.error, 1.5),
        labelStyle: const TextStyle(color: textMuted),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: white,
        selectedItemColor: teal,
        unselectedItemColor: textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
