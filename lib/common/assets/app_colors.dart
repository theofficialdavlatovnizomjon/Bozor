import 'package:app/common/shared_pref/shared_preferences_helper.dart';
import 'package:app/common/shared_pref/system_keys.dart';
import 'package:flutter/material.dart';

class AppColors {
  static bool _isDark = false;

  // // Метод для инициализации состояния isDark из SharedPreferences
  static Future<void> init() async {
    _isDark = PreferencesHelper.getBool(SystemKeys.theme) ??
        false; // По умолчанию светлая тема
  }

  // Метод для обновления isDark и сохранения в SharedPreferences
  static Future<void> updateTheme(bool isDark) async {
    _isDark = isDark;
    await SystemService.saveTheme(isDark);
  }

  // Геттеры для цветов
  static Color get primary => _isDark
      ? const Color(0xFF4CAF50) // Яркий зелёный для тёмной темы
      : const Color(0xFF2B6F02); // Яркий зелёный для светлой темы

  static Color get secondary => _isDark
      ? const Color(0xFF1A5BBF) // Синий для тёмной темы
      : const Color(0xFF4286F5); // Синий для светлой темы

  static Color get background => _isDark
      ? const Color(0xFF121212) // Тёмный фон
      : const Color(0xFFF0F4F1); // Светлый фон

  static Color get text => _isDark
      ? const Color(0xFFFFFFFF) // Белый текст для тёмной темы
      : const Color(0xFF000000); // Чёрный текст для светлой темы

  static Color get gray => _isDark
      ? const Color(0xFF121212) // Серый для тёмной темы
      : const Color(0xFFF5F5F5); // Светло-серый для светлой темы

  static Color get error => const Color(0xFFF44336); // Красный для обеих тем
}
