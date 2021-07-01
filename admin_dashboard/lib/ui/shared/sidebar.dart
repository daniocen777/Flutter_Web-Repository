import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/consts/colors.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separater.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'widgets/menu_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void _navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 300.0,
      height: double.infinity,
      decoration: _buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50.0),
          TextSeparator(text: 'Main'),
          MenuItem(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.home_outlined,
              onPress: () => this._navigateTo(Flurorouter.dashboardRoute)),
          MenuItem(
              text: 'Análisis',
              icon: Icons.show_chart_outlined,
              onPress: () => print('Análisis')),
          MenuItem(
              text: 'Categorías',
              icon: Icons.dashboard_outlined,
              onPress: () => print('Categorías')),
          MenuItem(
              text: 'Descuentos',
              icon: Icons.attach_money_outlined,
              onPress: () => print('Descuentos')),
          MenuItem(
              text: 'Clientes',
              icon: Icons.people_alt_outlined,
              onPress: () => print('Clientes')),
          MenuItem(
              text: 'Órdenes',
              icon: Icons.shopping_cart_outlined,
              onPress: () => print('Órdenes')),
          SizedBox(height: 30.0),
          TextSeparator(text: 'Elementos UI'),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              text: 'Íconos',
              icon: Icons.face_outlined,
              onPress: () => this._navigateTo(Flurorouter.iconsRoute)),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPress: () => print('Marketing')),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Página en blanco',
              icon: Icons.post_add_outlined,
              onPress: () => this._navigateTo(Flurorouter.blankRoute)),
          SizedBox(height: 30.0),
          TextSeparator(text: 'Salida'),
          MenuItem(
              text: 'Cerrar sesión',
              icon: Icons.exit_to_app,
              onPress: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              })
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [primaryColor, primaryLightColor]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10.0)]);
}
