import 'package:flutter/material.dart';

class AppTheme {
  get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          primary: Color(0xFFB73ECE),
          secondary: Color(0xFFFF128B),
          surface: Color(0xFF30FFFF),
          background: Color(0xFF141414),
          error: Color(0xFFCEDE18),
          onPrimary: Color(0xFFB73ECE),
          onSecondary: Color(0xFFFF128B),
          onSurface: Color(0xFF30FFFF),
          onBackground: Color(0xFF141414),
          onError: Color(0xFFCEDE18),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: Brightness.dark,
      );
}
