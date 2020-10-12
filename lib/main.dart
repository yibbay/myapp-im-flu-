import 'package:flutter/material.dart';
import './index.dart';
import 'common/Global.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Global.init().then((e) => runApp(MyApp()));
// };
void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attorney consultation',
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
