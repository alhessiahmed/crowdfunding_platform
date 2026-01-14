import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;

    Get.changeThemeMode(_themeMode.value);
  }

  void setTheme(ThemeMode mode) {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
  }
}
