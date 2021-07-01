import 'package:admin_dashboard/ui/consts/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.bubble_chart_outlined,
            color: acccentColor,
          ),
          SizedBox(width: 10.0),
          Text('Admin',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ]));
  }
}
