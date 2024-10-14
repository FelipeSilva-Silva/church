import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_cunstom.dart';

class RegisterButtonSave extends StatelessWidget {
  const RegisterButtonSave({
    super.key,
    required this.name,
    required this.icon,
    required this.backgroundColor,
    this.repository,
    this.context,
    this.model,
    required this.valid,
    this.controller,
  });

  final String name;
  final IconData icon;
  final Color backgroundColor;
  final dynamic repository;
  final BuildContext? context;
  final dynamic model;
  final dynamic controller;
  final GlobalKey<FormState> valid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ThemeCunstom.themeCunstomButtonSave,
        onPressed: () {},
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
