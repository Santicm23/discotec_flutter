import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:local_auth/local_auth.dart';

import 'package:discotec_flutter/presentation/screens/auth/widgets/auth_card_widget.dart';
import 'package:discotec_flutter/presentation/screens/auth/widgets/custom_title_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    void createDialog(String msg) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      );
    },);
  }
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
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if (prefs.getBool('isLogged') ?? false) {
            createDialog('Ya se encuentra logueado');
            return;
          }
          try {
            final bool didAuthenticate = await _auth.authenticate(
                localizedReason: 'Please authenticate to show account balance',
                options: const AuthenticationOptions(useErrorDialogs: false));
            if (didAuthenticate) {
              // TODO
            }
          } on PlatformException catch (e) {
            createDialog(e.message ?? 'Error desconocido');
          }
        },
        child: const Icon(Icons.fingerprint),
      ),
    );
  }
}
