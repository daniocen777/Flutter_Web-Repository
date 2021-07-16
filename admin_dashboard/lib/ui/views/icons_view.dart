import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        /* ListView => Para hacer un scroll */
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Text('Íconos', style: CustomLabels.h1),
          SizedBox(height: 10.0),
          /* Wrap => elementos aparezcan uno al lado del otro y se ajusta al tamaño de la pantalla*/
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                  title: 'ac_unit_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.ac_unit_outlined))),
              WhiteCard(
                  title: 'access_alarm_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.access_alarm_outlined))),
              WhiteCard(
                  title: 'dashboard_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.dashboard_outlined))),
              WhiteCard(
                  title: 'gamepad_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.gamepad_outlined))),
              WhiteCard(
                  title: 'hd_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.hd_outlined))),
              WhiteCard(
                  title: 'label_off_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.label_off_outlined))),
              WhiteCard(
                  title: 'policy_outlined',
                  width: 170.0,
                  child: Center(child: Icon(Icons.policy_outlined))),
            ],
          )
        ]));
  }
}
