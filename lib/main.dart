import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import './index.dart';
import 'package:flutter_framework/common/prefs.dart';

void main() async {
  Db();
  runApp(MyApp());
}

// Future dbComplate () {
//   Completer complete = Completer();
//   const timeout = const Duration(milliseconds: 100);
//   Timer.periodic(timeout, (timer) { //callback function
//     print(1);
//     if (Db.prefs != null) {
//       timer.cancel();  // 取消定时器
//       runApp(MyApp());
//       complete.complete();
//     }
//   });
// }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      routes: {
        'session/index': (_) => HomePage(),
        'contacts/index': (_) => Contacts(),
        'ucenter/index': (_) => Ucenter(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
