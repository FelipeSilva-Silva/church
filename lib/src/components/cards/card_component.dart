import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
    required this.text,
    required this.value,
    required this.color,
  });

  final String text;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width / 3 - 68,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              formatoMoeda.format(value),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
