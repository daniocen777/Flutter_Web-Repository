import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

class DashboardHandlers {
  static Handler main =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    // Setear la ruta para que quede active la opción de menú
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.dashboardRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      return DashboardView();
    } else {
      return LoginView();
    }
  });

  /* Icons */
  static Handler icons =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.iconsRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      return IconsView();
    } else {
      return LoginView();
    }
  });

  static Handler blank =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.blankRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      return BlankView();
    } else {
      return LoginView();
    }
  });
}
