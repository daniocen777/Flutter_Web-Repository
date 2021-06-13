import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ContactView extends StatelessWidget {
  static const String route = 'contact';
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('Contact',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 80.0, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
