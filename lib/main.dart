import 'package:flutter/material.dart';

import 'package:discotec_flutter/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      home: const Placeholder(),
    );
  }
}
