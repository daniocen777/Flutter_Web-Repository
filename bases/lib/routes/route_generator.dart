import 'package:bases/ui/views/counter_provider_view.dart';
import 'package:bases/ui/views/counter_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // saber si estoy en web

import 'package:bases/ui/pages/counter_provider_page.dart';
import 'package:bases/ui/pages/page_404.dart';
import 'package:bases/ui/pages/counter_page.dart';

/* Al final, no se usará esta clase para las rutas, sino el paquete 'package:fluro/fluro.dart'; */

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CounterPage.route:
        return _fadeRoute(CounterView(), CounterView.route);

      case CounterProviderPage.route:
        return _fadeRoute(CounterProviderView(), CounterProviderView.route);
      default:
        return _fadeRoute(Page404(), Page404.route);
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            child,
        transitionsBuilder: (_, animation, __, ___) => kIsWeb
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                child: child,
                linearTransition: true));
  }
}
