import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_colors.dart';

class DropMenuComponent extends StatelessWidget {
  const DropMenuComponent(
      {super.key,
      required this.hintText,
      required this.leadingIcon,
      required this.list,
      this.width});
  final String hintText;
  final Widget leadingIcon;
  final List<DropdownMenuEntry> list;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width / 3 - 68,
      leadingIcon: leadingIcon,
      requestFocusOnTap: false,
      dropdownMenuEntries: list,
      textStyle: const TextStyle(color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color.fromARGB(110, 255, 255, 255)),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        fillColor: ThemeColors.blueTheme,
      ),
      hintText: hintText,
    );
  }
}
