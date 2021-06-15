import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: (size.width > 1000) ? size.height * 0.07 : null,
        color: Colors.black87,
        // Wrap => div con flexbox
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(text: 'Acerca de', onPress: () => print('ACERCA DE ')),
            LinkText(text: 'Ayuda'),
            LinkText(text: 'Política de Privacidad'),
            LinkText(text: 'Información'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Estados'),
            LinkText(text: 'Recursos'),
            LinkText(text: 'Marketing'),
          ],
        ));
  }
}
