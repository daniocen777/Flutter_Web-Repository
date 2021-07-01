import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';

import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    // Mostrar el LoginView si no se está autenticado
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authState == AuthStatus.noAuthenticated) {
      return LoginView();
    } else {
      return DashboardView();
    }
  });

  static Handler register =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authState == AuthStatus.noAuthenticated) {
      return RegisterView();
    } else {
      return DashboardView();
    }
  });
}
