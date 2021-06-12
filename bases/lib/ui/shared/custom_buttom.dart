import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CustomButtom(
      {Key? key,
      required this.label,
      this.color = Colors.pink,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(primary: this.color),
        onPressed: this.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(this.label),
        ));
  }
}
