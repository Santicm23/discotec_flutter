import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:local_auth/local_auth.dart';

import 'package:discotec_flutter/presentation/screens/auth/widgets/auth_card_widget.dart';
import 'package:discotec_flutter/presentation/screens/auth/widgets/custom_title_widget.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _AuthView();
  }
}

class _AuthView extends StatelessWidget {
  final LocalAuthentication _auth = LocalAuthentication();

  _AuthView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final bool didAuthenticate = await _auth.authenticate(
                localizedReason: 'Please authenticate to show account balance',
                options: const AuthenticationOptions(useErrorDialogs: false));
          } on PlatformException catch (e) {
            // ignore: use_build_context_synchronously
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(e.message ?? ''),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Ok'),
                  ),
                ],
              );
            },);
          }
        },
        child: const Icon(Icons.fingerprint),
      ),
    );
  }
}
