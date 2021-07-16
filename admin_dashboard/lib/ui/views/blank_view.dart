import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        /* ListView => Para hacer un scroll */
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Text('Página en Blanco', style: CustomLabels.h1),
          SizedBox(height: 10.0),
          WhiteCard(title: 'Título del Card', child: Text('holas mundos')),
        ]));
  }
}
