import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class CustoMenuItem extends StatefulWidget {
  final String text;
  final Function onPress;
  final int delay;

  CustoMenuItem(
      {Key? key, required this.text, required this.onPress, this.delay = 0})
      : super(key: key);

  @override
  _CustoMenuItemState createState() => _CustoMenuItemState();
}

class _CustoMenuItemState extends State<CustoMenuItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10.0,
      duration: const Duration(milliseconds: 200),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          this._isHover = true;
        }),
        onExit: (_) => setState(() {
          this._isHover = false;
        }),
        child: GestureDetector(
          onTap: () => widget.onPress(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 150.0,
            height: 50.0,
            color: this._isHover ? Colors.pinkAccent : Colors.transparent,
            child: Center(
                child: Text(
              widget.text,
              style: GoogleFonts.roboto(fontSize: 20.0, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
