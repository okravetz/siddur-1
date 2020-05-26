
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeChanger with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: GoogleFonts.ralewayTextTheme(),
    primaryColor: Colors.black45,
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF000000),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black54,
  );
  final lightTheme = ThemeData(
    textTheme: GoogleFonts.ralewayTextTheme(),

    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Color(0xFFFFFFFF),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  bool _isDarkTheme = true;

  ThemeChanger(this._isDarkTheme);

  getTheme() => _isDarkTheme?darkTheme:lightTheme;
  switchThem() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}