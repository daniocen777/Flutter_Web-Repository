import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPress;

  const MenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.isActive = false,
      required this.onPress})
      : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: this.isHovered
            ? Colors.white.withOpacity(0.1)
            : (widget.isActive
                ? Colors.white.withOpacity(0.1)
                : Colors.transparent),
        child: Material(
            color: Colors.transparent,
            child: GestureDetector(
                onTap: widget.isActive ? null : () => widget.onPress(),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (_) => setState(() {
                              this.isHovered = true;
                            }),
                        onExit: (_) => setState(() {
                              this.isHovered = false;
                            }),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                widget.icon,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              SizedBox(width: 10.0),
                              Text(widget.text,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      color: Colors.white.withOpacity(0.9)))
                            ]))))));
  }
}
