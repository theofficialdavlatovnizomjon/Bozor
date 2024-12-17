import 'shared_preferences_helper.dart';

/// SharedPreferences orqali tizim ma'lumotlarini saqlash uchun kalitlar.
abstract class SystemKeys {
  const SystemKeys._();

  static const String fcmToken = "FCM_TOKEN";
  static const String deviceId = "DEVICE_ID";
  static const String deviceName = "DEVICE_NAME";
  static const String language = "LANGUAGE";
  static const String theme = "THEME";
}

/// SharedPreferences orqali tizim ma'lumotlarini boshqarish xizmati.
class SystemService {
  /// FCM tokenni saqlaydi.
  static Future<void> saveFcmToken(String token) async {
    await PreferencesHelper.setString(SystemKeys.fcmToken, token);
  }

  /// Tanlangan tilni saqlaydi.
  static Future<void> saveLanguage(String language) async {
    await PreferencesHelper.setString(SystemKeys.language, language);
  }

  /// Tanlangan mavzuni saqlaydi.
  static Future<void> saveTheme(bool theme) async {
    await PreferencesHelper.setBool(SystemKeys.theme, theme);
  }

  /// Qurilma ma'lumotlarini (ID va nom) saqlaydi.
  static Future<void> saveDeviceInfo({
    required String id,
    required String name,
  }) async {
    await Future.wait([
      PreferencesHelper.setString(SystemKeys.deviceId, id),
      PreferencesHelper.setString(SystemKeys.deviceName, name),
    ]);
  }

  /// Barcha tizim ma'lumotlarini tozalaydi.
  static Future<void> clear() async {
    await Future.wait([
      PreferencesHelper.remove(SystemKeys.fcmToken),
      PreferencesHelper.remove(SystemKeys.deviceId),
      PreferencesHelper.remove(SystemKeys.deviceName),
      PreferencesHelper.remove(SystemKeys.language),
      PreferencesHelper.remove(SystemKeys.theme),
    ]);
  }
}
