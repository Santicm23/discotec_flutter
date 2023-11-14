import 'package:flutter/material.dart';

class AppTheme {
  get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: Brightness.dark,
      );
}
