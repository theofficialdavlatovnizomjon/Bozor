import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key) => _preferences.getString(key);

  static Future<void> setString(String key, String value) =>
      _preferences.setString(key, value);

  static Future<void> setBool(String key, bool value) =>
      _preferences.setBool(key, value);

  static bool? getBool(String key) => _preferences.getBool(key);

  static Future<void> remove(String key) => _preferences.remove(key);
}
