import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void decrease() {
    _counter--;
    notifyListeners();
  }

  void increase() {
    _counter++;
    notifyListeners();
  }

  void clear() {
    _counter = 0;
    notifyListeners();
  }
}