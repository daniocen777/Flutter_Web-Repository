import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;
  String _currentPage = '';

  String get currentPage => this._currentPage;

  void setCurrentPage(String routeName) {
    this._currentPage = routeName;
    Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  // 300 => tamaño del sidebar
  /* Animación para abrir o cerrar el sidebar */
  static Animation<double> movement = Tween<double>(begin: -300.0, end: 0.0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));
/* Animación para colocar opacidad al contenido */
  static Animation<double> opacity = Tween<double>(begin: 0.0, end: 1.0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuController.forward(); // Play a la animación
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
