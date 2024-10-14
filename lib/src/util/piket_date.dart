import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PikerDate {
  static Future<String> piketDate(BuildContext context) async {
    final DateTime? piketDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 130)),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 20),
      ),
    );

    if (piketDate != null) {
      return DateFormat('dd/MM/yyyy', 'pt').format(piketDate);
    } else {
      return '';
    }
  }
}
