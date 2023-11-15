import 'package:discotec_flutter/presentation/screens/auth/widgets/auth_card_widget.dart';
import 'package:discotec_flutter/presentation/screens/auth/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthView();
  }
}

class _AuthView extends StatelessWidget {
  const _AuthView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTitle(),
              SizedBox(height: 32),
              AuthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
