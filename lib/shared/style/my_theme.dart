import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFF39A552);
  static Color OnprimaryColor = Color(0xFFDFECDB);
  static Color RedColor = Color(0xFFEC4B4B);
  static Color GreenColor = Color(0xFF61E757);
  static Color DarkOnprimaryColor = Color(0xFF081231);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: OnprimaryColor,
    appBarTheme: AppBarTheme(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 23),
      centerTitle: true,
      color: primaryColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: Colors.grey, //text of badg of Add New Task__feild text
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 10,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
  );
}
