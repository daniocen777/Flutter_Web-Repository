import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class NotPageFoundView extends StatelessWidget {
  const NotPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text('404 - Página No Encontrada',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 45.0, fontWeight: FontWeight.w700))));
  }
}
