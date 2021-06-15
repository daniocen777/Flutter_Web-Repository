import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function? onPress;

  const LinkText({Key? key, required this.text, this.onPress})
      : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPress != null) widget.onPress!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => this.isHover = true),
        onExit: (_) => setState(() => this.isHover = false),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(this.widget.text,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  decoration: this.isHover
                      ? TextDecoration.underline
                      : TextDecoration.none)),
        ),
      ),
    );
  }
}
