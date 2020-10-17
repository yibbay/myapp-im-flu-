import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MainProvide extends ChangeNotifier {
  int curNum = 0;
  add() {
    curNum += 1;
    notifyListeners();
  }

  minus() {
    curNum -= 1;
    notifyListeners();
  }
}


class UserModle extends MainProvide {
  List get users => [];
  set user(List data) {
    notifyListeners();
  }
}