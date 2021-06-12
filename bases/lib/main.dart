import 'package:flutter/material.dart';

import 'package:bases/routes/router.dart';
import 'package:bases/services/navigation_service.dart';
import 'package:bases/locator.dart';
import 'package:bases/ui/layouts/main_layout_page.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bases Web Flutter',
      initialRoute: '/',
      navigatorKey: locator<NavigationService>().navigatorKey,
      /* Usando RoutesGenerator */
      // onGenerateRoute: RouteGenerator.generateRoute,
      /* Usando fluro */
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ?? CircularProgressIndicator(),
        );
      },
    );
  }
}
