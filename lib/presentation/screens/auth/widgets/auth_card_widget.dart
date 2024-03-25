import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:slide_switcher/slide_switcher.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({
    super.key,
  });

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool loginOption = true;

  void changeView(int index) {
    setState(() {
      loginOption = index == 0;
    });
  }

  Future<void> savePreferences(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setBool('isLogged', true);
  }

  void createDialog(context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
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
      },
    );
  }

  Future<void> loginFunction(context, FirebaseAuth auth, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      createDialog(context, 'Usuario o contraseña incorrectos');
    }
  }

  Future<void> signUpFunction(context, FirebaseAuth auth, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      createDialog(context, 'Error al crear el usuario');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    TextEditingController emailLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();
    TextEditingController emailSignUpController = TextEditingController();
    TextEditingController passwordSignUpController = TextEditingController();

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: loginOption ? 240 : 380,
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
                  child: loginOption
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
          onPressed: () {
            FirebaseAuth auth = FirebaseAuth.instance;
            if (loginOption) {
              try {
                loginFunction(context, auth, emailLoginController.text,
                    passwordLoginController.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found' || e.code == 'invalid-email') {
                  createDialog(context, 'Usuario o contraseña incorrectos');
                }
              }
            } else {
              signUpFunction(context, auth, emailSignUpController.text,
                  passwordSignUpController.text);
            }
          },
          child: Text(loginOption ? 'Login' : 'SignUp',
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
