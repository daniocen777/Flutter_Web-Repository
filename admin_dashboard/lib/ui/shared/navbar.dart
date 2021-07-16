import 'package:flutter/material.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: 50.0,
        decoration: _buildDecoration(),
        child: Row(children: [
          if (size.width <= 700)
            IconButton(
                icon: Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu()),
          SizedBox(width: 5.0),
          /* Caja de búsqueda */
          if (size.width > 400)
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250.0),
                child: SearchText()),
          Spacer(),
          /* Notificaciones */
          NotificationIndicator(),
          SizedBox(width: 10.0),
          /* Avatar */
          NavbarAvatar(),
          SizedBox(width: 10.0),
        ]));
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)]);
  }
}
