import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatelessWidget {
  static const String route = 'location';
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('Location',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 80.0, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
