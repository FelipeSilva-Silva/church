import 'package:flutter/material.dart';

class DropMenuRegisterComponent extends StatelessWidget {
  const DropMenuRegisterComponent(
      {super.key,
      required this.width,
      required this.hintText,
      required this.list,
      required this.controller});
  final double width;
  final String hintText;
  final TextEditingController controller;
  final List<DropdownMenuEntry> list;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: controller,
      label: Text(hintText),
      width: width,
      initialSelection: 0,
      menuHeight: 200,
      requestFocusOnTap: false,
      dropdownMenuEntries: list,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontWeight: FontWeight.w500),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
