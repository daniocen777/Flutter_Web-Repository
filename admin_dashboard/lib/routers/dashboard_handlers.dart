import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/index.dart';

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

  /* Categorías */
  static Handler categories =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.categoriesRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      return CategoriesView();
    } else {
      return LoginView();
    }
  });

  /* Users */
  static Handler users =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.usersRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      return UsersView();
    } else {
      return LoginView();
    }
  });
  /* Usuario para editar */
  static Handler user =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.userRoute);
    if (authProvider.authState == AuthStatus.authenticated) {
      /* Verificar el envío de "uid" en la url */
      if (parameters['uid']?.first != null) {
        return UserView(uid: parameters['uid']!.first);
      } else {
        return UsersView();
      }
    } else {
      return LoginView();
    }
  });

  /* Página en blanco */
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
