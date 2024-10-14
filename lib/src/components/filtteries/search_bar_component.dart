import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_colors.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent(
      {super.key,
      required this.searchName,
      required this.prefixIcon,
      required this.sufixIcon});

  final String searchName;
  final Widget prefixIcon;
  final Widget sufixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: ThemeColors.blueTheme,
          hintText: searchName,
          hintStyle: const TextStyle(color: Color.fromARGB(110, 255, 255, 255)),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
