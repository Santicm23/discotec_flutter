import 'package:discotec_flutter/presentation/screens/auth/auth_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AuthScreen.routeName,
  routes: [
    GoRoute(
      path: AuthScreen.routeName,
      builder: (context, state) => const AuthScreen(),
    ),
  ],
);
