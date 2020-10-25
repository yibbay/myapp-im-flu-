import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_framework/models/index.dart';
import 'dart:convert';
import 'package:toast/toast.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  static SharedPreferences prefs;
  static BuildContext appContext;
  static Function toast = (msg) {
    Toast.show(msg, appContext, gravity: Toast.CENTER, backgroundRadius: 4);
  };

  static Profile profile = Profile();

  // 可选主题
  static List<MaterialColor> get themes => _themes;

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
    String _profile = prefs.getString('profile');
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
  }

  // 持久化Profile信息
  static saveProfile() =>
      prefs.setString("profile", jsonEncode(profile.toJson()));
}
