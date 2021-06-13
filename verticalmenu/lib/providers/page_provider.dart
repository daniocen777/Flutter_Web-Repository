import 'package:flutter/material.dart';

import 'package:universal_html/html.dart' as html;

import 'package:verticalmenu/ui/views/index.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();
  List<String> _pages = [
    HomeView.route,
    AboutView.route,
    ContactView.route,
    LocationView.route,
    PricingView.route
  ];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    this.scrollController =
        PageController(initialPage: this._getPageIndex(routeName));
    /* Cambiar el título de la página */
    html.document.title = _pages[this._getPageIndex(routeName)];
    /* Escuchar los cambios al hacer scroll para actualizar la ruta */
    this.scrollController.addListener(() {
      final int pageIndex = (this.scrollController.page ?? 0).round();
      if (pageIndex != _currentIndex) {
        // Moverse a la página
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        this._currentIndex = pageIndex;
        html.document.title = _pages[pageIndex];
      }
    });
  }

  int _getPageIndex(String routeName) {
    return (this._pages.indexOf(routeName) == -1)
        ? 0
        : this._pages.indexOf(routeName);
  }

  goTo(int index) {
    // final routeName = _pages[index];
    // html.window.history.pushState(null, 'none', '#/${_pages[index]}');
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
