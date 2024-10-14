import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_colors.dart';

class ThemeCunstom {
  static const themeCunstomButtonSave = ButtonStyle(
    shape: MaterialStatePropertyAll(
      ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
    backgroundColor: MaterialStatePropertyAll(ThemeColors.blueV),
  );

  static const themeCunstomButtonCancel = ButtonStyle(
    shape: MaterialStatePropertyAll(
      ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
    backgroundColor: MaterialStatePropertyAll(ThemeColors.redV),
  );
}
