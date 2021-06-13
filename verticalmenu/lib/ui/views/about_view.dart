import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  static const String route = 'about';
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('About',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 80.0, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
