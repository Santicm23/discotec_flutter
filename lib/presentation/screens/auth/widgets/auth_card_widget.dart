import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:slide_switcher/slide_switcher.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({
    super.key,
  });

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool login = true;

  void changeView(int index) {
    setState(() {
      login = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    TextEditingController emailLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: login ? 240 : 380,
          decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _AuthSlideSwitcher(onSelect: changeView),
                const SizedBox(height: 8),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: login
                      ? _LoginForm(
                          emailController: emailLoginController,
                          passwordController: passwordLoginController,
                        )
                      : const _SignUpForm(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primaryContainer,
          ),
          onPressed: () async {
            if (login) {
              FirebaseAuth auth = FirebaseAuth.instance;
              try {
                await auth.signInWithEmailAndPassword(email: emailLoginController.text, password: passwordLoginController.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  
                } else if (e.code == 'wrong-password') {
                  
                }
              }
            }
          },
          child: Text(login ? 'Login' : 'SignUp',
              style: TextStyle(color: colors.secondary)),
        ),
      ],
    );
  }
}

class _AuthSlideSwitcher extends StatelessWidget {
  final Function(int) onSelect;

  const _AuthSlideSwitcher({
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SlideSwitcher(
      onSelect: onSelect,
      containerHeight: 50,
      containerWight: 200,
      containerColor: colors.background,
      slidersColors: [
        colors.primaryContainer,
      ],
      children: const [
        Text('Login'),
        Text('SignUp'),
      ],
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm();

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombre completo',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Número de documento',
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
        ],
      ),
    );
  }
}
