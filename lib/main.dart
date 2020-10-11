import 'package:flutter/material.dart';
import 'dart:math';
import './index.dart';

void main() => runApp(MyApp());

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
