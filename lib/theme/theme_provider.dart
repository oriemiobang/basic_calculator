// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  changeTheme() {
    _isDark = !_isDark;
    storage.setBool('isDark', _isDark);
    notifyListeners();
  }

  final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(color: Colors.transparent),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      scaffoldBackgroundColor: Color.fromARGB(216, 255, 255, 255),
      brightness: Brightness.light);

  final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      brightness: Brightness.dark);

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool('isDark') ?? false;
    notifyListeners();
  }
}
