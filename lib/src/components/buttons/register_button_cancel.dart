import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_cunstom.dart';

class RegisterButtonCancel extends StatelessWidget {
  const RegisterButtonCancel({
    super.key,
    required this.name,
    required this.icon,
    required this.backgroundColor,
  });

  final String name;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ThemeCunstom.themeCunstomButtonCancel,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
