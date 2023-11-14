import 'package:flutter/material.dart';

class AppTheme {
  get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB73ECE),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: Brightness.dark,
      );
}
