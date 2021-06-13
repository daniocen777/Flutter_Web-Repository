import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  static const String route = 'home';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('Home',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 80.0, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
