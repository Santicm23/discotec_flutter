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
                SlideSwitcher(
                  onSelect: changeView,
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
                ),
                const SizedBox(height: 8),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: login ? LoginForm(colors: colors) : const SignUpForm(),
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
          onPressed: () {},
          child: Text(login ? 'Login' : 'SignUp', style: TextStyle(color: colors.secondary)),
        ),
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
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

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

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
