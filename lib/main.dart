import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:discotec_flutter/config/router/app_router.dart';
import 'package:discotec_flutter/firebase_options.dart';
import 'package:discotec_flutter/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
