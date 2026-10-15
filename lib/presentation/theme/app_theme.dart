import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _background = Color(0xFF0B0D12);
  static const _surface = Color(0xFF151923);
  static const _accent = Color(0xFF7C5CFC);

  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: _accent,
      brightness: Brightness.dark,
      surface: _surface,
    );
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Geist',
      scaffoldBackgroundColor: _background,
      colorScheme: scheme.copyWith(
        primary: _accent,
        secondary: const Color(0xFF30D5C8),
        surface: _surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surface,
        hintStyle: const TextStyle(color: Color(0xFF858B9B)),
        prefixIconColor: const Color(0xFF858B9B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF242A37)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: _accent, width: 1.5),
        ),
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: _accent,
        inactiveTrackColor: Color(0xFF303647),
        thumbColor: Colors.white,
        overlayColor: Color(0x337C5CFC),
        trackHeight: 3,
      ),
    );
  }
}
