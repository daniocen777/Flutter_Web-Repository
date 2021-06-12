import 'package:bases/routes/routes_handlers.dart';
import 'package:fluro/fluro.dart';

import 'package:bases/ui/views/counter_provider_view.dart';
import 'package:bases/ui/views/counter_view.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define('/',
        handler: counterHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 150));
    /* ruta sin variable en la url */
    router.define(CounterView.route,
        handler: counterHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 150));
    /* ruta con variable en la url */
    router.define('${CounterView.route}/:base',
        handler: counterHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 150));

    /* ruta con query y 1 parámetro */
    router.define(CounterProviderView.route,
        handler: counterProviderHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 150));

    /* ruta con query y varios parámetros */
    router.define('${CounterProviderView.route}/users/:userid/:roleid',
        handler: counterProviderUserHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 100));

    router.notFoundHandler = counter404Handler;
  }
}
