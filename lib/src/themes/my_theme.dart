import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
  ),
  scrollbarTheme: const ScrollbarThemeData(
    thumbColor: MaterialStatePropertyAll(Colors.white),
    interactive: true,
    thumbVisibility: MaterialStatePropertyAll(true),
    trackVisibility: MaterialStatePropertyAll(false),
  ),
  dataTableTheme: DataTableThemeData(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 16, 43),
      borderRadius: BorderRadius.circular(5),
    ),
    dataTextStyle: const TextStyle(color: Colors.white),
    headingTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    columnSpacing: 12,
    horizontalMargin: 12,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    fillColor: Colors.white,
    filled: true,
  ),
);
