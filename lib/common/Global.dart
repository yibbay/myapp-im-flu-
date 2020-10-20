import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_framework/models/index.dart';
import 'dart:convert';

const _pubkey = '''-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCYTLI5jXV0Qe3tcCRrVE5AMAPB
tL4Lf8ysbjwSHTad4XuJ0fvt9Qdj13SBU7LAhfw+TCIlYMF4aOUumtsRUpkvoUjb
EnnptaAB3z235r6iiMbhB7eSfL/rVnOi/NQLUm0VnaDweijgA313vfkIYAXr+W2Y
hBst0cGaBOOiZkbgsQIDAQAB
-----END PUBLIC KEY-----''';
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  static SharedPreferences prefs;

  static Profile profile = Profile();

  // 可选主题
  static List<MaterialColor> get themes => _themes;
  // 公钥
  static String get pubkey => _pubkey; 

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


