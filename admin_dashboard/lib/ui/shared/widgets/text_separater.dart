import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  final String text;
  const TextSeparator({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(bottom: 5.0),
      child: Text(this.text,
          style: GoogleFonts.roboto(
              color: Colors.white.withOpacity(0.3), fontSize: 12.0)),
    );
  }
}
