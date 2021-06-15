import 'package:admin_dashboard/routers/admin_handlers.dart';
import 'package:admin_dashboard/routers/not_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  /* Nombre de las rutas */
  static String root = '/';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    /* Auth */
    router.define(root,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    // router.define(dashboardRoute, handler: handler);

    /* 404 */
    router.notFoundHandler = NotPageFoundHandlers.noPageFound;
  }
}
