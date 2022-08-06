import 'package:flutter/material.dart';

appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff191970),
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color(0xff191970),
        iconTheme: MaterialStateProperty.all(
          IconThemeData(
            color: Colors.white,
            size: 28,
          ),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xff191970),
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 16,
        color: Color(0xff191970),
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 18,
        color: Color(0xff191970),
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontSize: 16,
        color: Color(0xff191970),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
