import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.icon,
      this.color = Colors.indigo,
      this.isFilled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => onPress(), 
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(this.color.withOpacity(0.5)),
            overlayColor:
                MaterialStateProperty.all(this.color.withOpacity(0.3))),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(this.text, style: TextStyle(color: Colors.white))
          ],
        ));
  }
}
