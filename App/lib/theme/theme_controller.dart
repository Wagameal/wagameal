import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app_colours.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  ThemeData get currentTheme {
    return isDarkMode.value ? ThemeData.dark() : ThemeData.light();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
