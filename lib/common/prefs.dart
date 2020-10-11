import 'package:shared_preferences/shared_preferences.dart';

class Db {
  static Db _prefs;
  Db._();
  factory Db ()  {
    if (_prefs == null) {
      _prefs = Db._();
      _prefs.initPrefs();
    }
    return _prefs;
  }
  static var prefs;
  initPrefs () {
    prefs = SharedPreferences.getInstance;
  }
}
