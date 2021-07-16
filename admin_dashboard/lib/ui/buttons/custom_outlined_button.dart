import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color color;
  final bool isFilled;
  final bool isTextWhite;

  const CustomOutlinedButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.color = Colors.blue,
      this.isFilled = false,
      this.isTextWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
            side: MaterialStateProperty.all(BorderSide(color: this.color)),
            backgroundColor: MaterialStateProperty.all(this.isFilled
                ? this.color.withOpacity(0.3)
                : Colors.transparent)),
        onPressed: () => this.onPress(),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(this.text,
                style: TextStyle(
                    fontSize: 16.0,
                    color: isTextWhite ? Colors.white : this.color))));
  }
}
