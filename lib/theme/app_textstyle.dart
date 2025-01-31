import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const fontFmaily = 'DefaultFont';
  static const fontFamilySecond = 'DefaultFont2';
  static const heightFigma = 1.2;
  static const spacingFigma = 0.2;

  static TextStyle appHeader = TextStyle(
    fontFamily: fontFmaily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 18.66.toFigmaHeight(16),
  );

  static TextStyle body1 = TextStyle(
    fontFamily: fontFmaily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 18.66.toFigmaHeight(16),
  );

  static TextStyle bodyLarge = TextStyle(
    fontFamily: fontFmaily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 18.66.toFigmaHeight(16),
  );

  static TextTheme buildTextTheme(
    TextTheme base,
    String? language, [
    String fontFamily = 'DefaultFont',
    String fontHeader = 'DefaultFont',
    double height = 1.2,
  ]) {
    return base
        .copyWith(
          displayLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 88,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          displayMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 72,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          displaySmall: TextStyle(
            fontFamily: fontFamily,
            fontSize: 60,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          headlineLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          headlineMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          headlineSmall: TextStyle(
            fontFamily: fontFamily,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            height: height,
          ),
          titleLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 32,
            fontWeight: FontWeight.w500,
            height: height,
          ),
          titleMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            height: height,
          ),
          titleSmall: TextStyle(
            fontFamily: fontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: height,
          ),
          bodyLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 22,
            fontWeight: FontWeight.normal,
            height: height,
          ),
          bodyMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: height,
          ),
          bodySmall: TextStyle(
            fontFamily: fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: height,
          ),
          labelLarge: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: height,
          ),
          labelMedium: TextStyle(
            fontFamily: fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: height,
          ),
          labelSmall: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: height,
          ),
        )
        .apply(
          displayColor: AppColors.textColor,
          bodyColor: AppColors.textColor,
        );
  }
}

extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}
