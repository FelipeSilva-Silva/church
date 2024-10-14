import 'package:flutter/material.dart';

class TableButton extends StatelessWidget {
  const TableButton(
      {super.key,
      required this.name,
      required this.icon,
      required this.backgroundColor,
      required this.action});

  final String name;
  final IconData icon;
  final Color? backgroundColor;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
        ),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return action;
            },
          );
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
