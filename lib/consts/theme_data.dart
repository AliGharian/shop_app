import 'package:flutter/material.dart';

class Styles {
  static themData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColorDark: Colors.black,
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : Colors.grey.shade300,
      primarySwatch: Colors.red, // this is the main color of the app
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      accentColor: Colors.deepOrange, // this is the second main color of app
      backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme
          ? Color(0xff372901)
          : Color(0xffFCE192), //when press and hold a button
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xff151515) : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: ColorScheme.dark(),
          ),
      appBarTheme: AppBarTheme(
        elevation: 2.0,
      ),
    );
  }
}
