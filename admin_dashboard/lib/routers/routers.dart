import 'package:admin_dashboard/routers/admin_handlers.dart';
import 'package:admin_dashboard/routers/dashboard_handlers.dart';
import 'package:admin_dashboard/routers/not_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  /* Nombre de las rutas */
  static String root = '/';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  static void configureRoutes() {
    /* Auth */
    router.define(root,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    /* Dashboard */
    router.define(dashboardRoute,
        handler: DashboardHandlers.main, transitionType: TransitionType.fadeIn);
    /* Página de íconos */
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);
    /* Página en blanco */
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);

    /* 404 */
    router.notFoundHandler = NotPageFoundHandlers.noPageFound;
  }
}
