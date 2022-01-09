import 'package:flutter/material.dart';

class CustomColor {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const green = Color(0xFF21DAA3);
  static const blue = Color(0xFF1F222B);
  static const orange = Color(0xFFFFBEA6);
  static const gray = Color(0xFFF5F5F5);
  static const darkGray = Color(0xFF707070);
  static const red = Color(0xFFDA2121);
  static const lightRed = Color(0xFFFF8181);
}

class CustomMaterialColor {
  static const white = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });

  static const black = MaterialColor(0xFF000000, {
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  });

  static const blue = MaterialColor(0xFF1F222B, {
    50: Color(0xFF1F222B),
    100: Color(0xFF1F222B),
    200: Color(0xFF1F222B),
    300: Color(0xFF1F222B),
    400: Color(0xFF1F222B),
    500: Color(0xFF1F222B),
    600: Color(0xFF1F222B),
    700: Color(0xFF1F222B),
    800: Color(0xFF1F222B),
    900: Color(0xFF1F222B),
  });

  static const orange = MaterialColor(0xFFFFBEA6, {
    50: Color(0xFFFFBEA6),
    100: Color(0xFFFFBEA6),
    200: Color(0xFFFFBEA6),
    300: Color(0xFFFFBEA6),
    400: Color(0xFFFFBEA6),
    500: Color(0xFFFFBEA6),
    600: Color(0xFFFFBEA6),
    700: Color(0xFFFFBEA6),
    800: Color(0xFFFFBEA6),
    900: Color(0xFFFFBEA6),
  });

  static const green = MaterialColor(0xFF21DAA3, {
    50: Color(0xFF21DAA3),
    100: Color(0xFF21DAA3),
    200: Color(0xFF21DAA3),
    300: Color(0xFF21DAA3),
    400: Color(0xFF21DAA3),
    500: Color(0xFF21DAA3),
    600: Color(0xFF21DAA3),
    700: Color(0xFF21DAA3),
    800: Color(0xFF21DAA3),
    900: Color(0xFF21DAA3),
  });

  static const gray = MaterialColor(0xFF1F222B, {
    50: Color(0xFF1F222B),
    100: Color(0xFF1F222B),
    200: Color(0xFF1F222B),
    300: Color(0xFF1F222B),
    400: Color(0xFF1F222B),
    500: Color(0xFF1F222B),
    600: Color(0xFF1F222B),
    700: Color(0xFF1F222B),
    800: Color(0xFF1F222B),
    900: Color(0xFF1F222B),
  });

  static const darkGray = MaterialColor(0xFF707070, {
    50: Color(0xFF707070),
    100: Color(0xFF707070),
    200: Color(0xFF707070),
    300: Color(0xFF707070),
    400: Color(0xFF707070),
    500: Color(0xFF707070),
    600: Color(0xFF707070),
    700: Color(0xFF707070),
    800: Color(0xFF707070),
    900: Color(0xFF707070),
  });

  static const red = MaterialColor(0xFFDA2121, {
    50: Color(0xFFDA2121),
    100: Color(0xFFDA2121),
    200: Color(0xFFDA2121),
    300: Color(0xFFDA2121),
    400: Color(0xFFDA2121),
    500: Color(0xFFDA2121),
    600: Color(0xFFDA2121),
    700: Color(0xFFDA2121),
    800: Color(0xFFDA2121),
    900: Color(0xFFDA2121),
  });

  static const lightRed = MaterialColor(0xFFFF8181, {
    50: Color(0xFFFF8181),
    100: Color(0xFFFF8181),
    200: Color(0xFFFF8181),
    300: Color(0xFFFF8181),
    400: Color(0xFFFF8181),
    500: Color(0xFFFF8181),
    600: Color(0xFFFF8181),
    700: Color(0xFFFF8181),
    800: Color(0xFFFF8181),
    900: Color(0xFFFF8181),
  });
}

class CustomMaterialStatePropertyColor {
  final white = MaterialStateProperty.all<Color>(CustomColor.white);
  final black = MaterialStateProperty.all<Color>(CustomColor.black);
  final green = MaterialStateProperty.all<Color>(CustomColor.green);
  final blue = MaterialStateProperty.all<Color>(CustomColor.blue);
  final orange = MaterialStateProperty.all<Color>(CustomColor.orange);
  final gray = MaterialStateProperty.all<Color>(CustomColor.gray);
  final darkGray = MaterialStateProperty.all<Color>(CustomColor.darkGray);
  final red = MaterialStateProperty.all<Color>(CustomColor.red);
  final lightRed = MaterialStateProperty.all<Color>(CustomColor.lightRed);
}
