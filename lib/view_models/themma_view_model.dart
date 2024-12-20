import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkTheme ? darkTheme : lightTheme;
  }

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white, 
    cardColor: Colors.white,
    canvasColor: Colors.black,
    shadowColor: Colors.black,

    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.orange,
      onSecondary: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black,),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.grey) 
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black, 
    cardColor: Colors.grey.shade800,
    canvasColor: Colors.grey.shade800,
    shadowColor: Colors.white.withOpacity(1),

    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,

    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white,),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.grey)
    ),
  );
}
