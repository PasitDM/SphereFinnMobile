import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffFEC00F);
  static const Color textColor = Color(0xff000000);

  static const Color ci2Color = Color(0xffF15A21);
  static const Color white = Color(0xffFFFFFF);

  static const Color errorRed = Color(0xFFe74c3c);
  static const Color darkBG = Color(0xff1B1D26);

  static const Color red300 = Color(0xffED1C24);

  /// Color theme
  static const ColorScheme kColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: ci2Color,
    surface: Colors.white,
    error: red300,
    onPrimary: darkBG,
    onSecondary: ci2Color,
    onSurface: darkBG,
    onError: white,
    brightness: Brightness.light,
  );
}
