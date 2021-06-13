import 'package:fluro/fluro.dart';

import 'package:verticalmenu/routers/routers_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    /* Home */
    router.define('/:page', handler: homeHandler);
    /* 404 */
    router.notFoundHandler = homeHandler;
  }
}
