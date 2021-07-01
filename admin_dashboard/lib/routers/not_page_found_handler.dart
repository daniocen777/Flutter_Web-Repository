import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/not_page_found_view.dart';

class NotPageFoundHandlers {
  static Handler noPageFound =
      new Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPage('/404');
    return NotPageFoundView();
  });
}
