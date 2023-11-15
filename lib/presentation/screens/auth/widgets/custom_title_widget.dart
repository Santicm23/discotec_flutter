import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          'Discotec',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color:  colors.primary
          ),
        ),
        const SizedBox(height: 16),
        Image.asset('assets/images/logo.png', width: 100,)
      ],
    );
  }
}
