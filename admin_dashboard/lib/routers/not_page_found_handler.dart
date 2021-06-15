import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/not_page_found_view.dart';

class NotPageFoundHandlers {
  static Handler noPageFound =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    return NotPageFoundView();
  });
}
