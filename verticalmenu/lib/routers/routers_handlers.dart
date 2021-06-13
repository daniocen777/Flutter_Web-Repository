import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:verticalmenu/providers/page_provider.dart';
import 'package:verticalmenu/ui/pages/home_page.dart';

final homeHandler =
    Handler(handlerFunc: (context, Map<String, List<String>> parameters) {
  final page = parameters['page']!.first;
  if (page != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(page);
    return HomePage();
  }
});
