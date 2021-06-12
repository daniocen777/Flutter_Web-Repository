import 'package:fluro/fluro.dart';

import 'package:bases/ui/views/counter_provider_view.dart';
import 'package:bases/ui/views/counter_view.dart';
import 'package:bases/ui/views/view_404.dart';

/* Manejadores */
// Counter stateful
final Handler counterHandler =
    new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
  /* Obtener variables de la ruta (base) */
  // print(parameters['base']?[0]);
  return CounterView(base: parameters['base']?[0] ?? '5');
});

// Counter Provider
final Handler counterProviderHandler =
    new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
  CounterProviderView(base: parameters['q']?[0] ?? '5');
});
/* CounterProvider con varios parámetros en la url */
final Handler counterProviderUserHandler =
    new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
  print(parameters);
  CounterProviderView(base: parameters['q']?[0] ?? '5');
});
// 404
final Handler counter404Handler = new Handler(
    handlerFunc: (context, Map<String, List<String>> parameters) => View404());
