import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            '登录',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          onPressed: () => {},
          color: Colors.blue,
        ),
      ),
    );
  }
}