import 'package:flutter/material.dart';

class myTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      // primaryColor: Colors,
      iconTheme: IconThemeData(color: Colors.black));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        // primaryIconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          color: Color(0xFF128C7E),
        ),
        dividerTheme: DividerThemeData(color: Colors.black26),
        // popupMenuTheme: PopupMenuThemeData(color: Colors.blueGrey[800]),
      );

  static Color creamColor = Color(0xfff5f5f5);

  static Color blueColor = Color(0xfff548);

  static ThemeData themeData() => ThemeData();
}
