import 'package:flutter/widgets.dart';

class CounterPrivider extends ChangeNotifier {
  int _counter = 15;
  // Constructor con varible para recibir parámetro desde el url
  CounterPrivider(String base) {
    if (int.tryParse(base) != null) {
      this._counter = int.parse(base);
    }
  }

  get counter => this._counter;

  void increment() {
    this._counter += 1;
    notifyListeners();
  }

  void decrement() {
    this._counter -= 1;
    notifyListeners();
  }
}
