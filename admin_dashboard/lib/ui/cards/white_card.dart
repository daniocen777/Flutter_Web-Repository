import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;

  const WhiteCard({Key? key, this.title, required this.child, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width != null ? this.width : null,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: _buildDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null) ...[
            FittedBox(
                fit: BoxFit.contain,
                child: Text(this.title!,
                    style: GoogleFonts.roboto(
                        fontSize: 15.0, fontWeight: FontWeight.bold))),
            Divider()
          ],
          this.child
        ]));
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5.0)
        ]);
  }
}
