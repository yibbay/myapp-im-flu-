import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
