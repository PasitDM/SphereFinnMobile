import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_textstyle.dart';

class AppTheme {
  static ElevatedButtonThemeData primaryButtonTheme({
    String fontFamily = 'DefaultFont',
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            height: 31.2.toFigmaHeight(24),
          ),
          foregroundColor: AppColors.textColor,
          backgroundColor: AppColors.primaryColor,
          disabledBackgroundColor: AppColors.disableIcon,
          disabledForegroundColor: AppColors.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
      );

  final bottomNavigationBarThemeData = BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.bottomTabColor,
    selectedItemColor: AppColors.bottomTabActiveColor,
    unselectedItemColor: AppColors.bottomTabDefaultColor,
    unselectedLabelStyle: TextStyle(
      fontFamily: "DefaultFont",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 19.18.toFigmaHeight(16),
    ).copyWith(color: AppColors.bottomTabDefaultColor),
    selectedLabelStyle: TextStyle(
      fontFamily: "DefaultFont",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 19.18.toFigmaHeight(16),
    ).copyWith(color: AppColors.bottomTabActiveColor),
  );

  static AppBarTheme appBarThemeData({
    String fontFamily = 'DefaultFont',
  }) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkBG,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          height: 33.6.toFigmaHeight(24),
          fontFamily: fontFamily,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.iconStroke,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      );

  IconThemeData customIconTheme(IconThemeData original) {
    return original.copyWith(color: AppColors.textColor);
  }

  ThemeData buildLightTheme(
    String? language, [
    String fontFamily = 'DefaultFont',
    String fontHeader = 'DefaultFont2',
    bool? useMaterial3 = true,
  ]) {
    final base = ThemeData.light(useMaterial3: useMaterial3);

    return base.copyWith(
      brightness: Brightness.light,
      cardColor: Colors.white,
      buttonTheme: const ButtonThemeData(
        colorScheme: AppColors.kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: AppColors.darkBG,
      ),
      primaryColorLight: AppColors.lightBG,
      primaryIconTheme: customIconTheme(base.iconTheme),
      textTheme: AppTextStyle.buildTextTheme(base.textTheme, language, fontFamily, fontHeader),
      primaryTextTheme: AppTextStyle.buildTextTheme(base.primaryTextTheme, language, fontFamily, fontHeader),
      iconTheme: customIconTheme(base.iconTheme),
      hintColor: Colors.black26,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightBG,
      appBarTheme: appBarThemeData(fontFamily: fontFamily),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primaryColor,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 4.0,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 4,
        dividerColor: Color(0xffEEEEEE),
        indicatorColor: AppColors.primaryColor,
        unselectedLabelColor: Color(
          0xff757575,
        ),
        labelStyle: TextStyle(
          fontFamily: 'DefaultFont',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          height: 1.4,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'DefaultFont',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
      ),
      dialogBackgroundColor: AppColors.lightBG,
      colorScheme: AppColors.kColorScheme,
      elevatedButtonTheme: primaryButtonTheme(fontFamily: fontFamily),
      bottomNavigationBarTheme: bottomNavigationBarThemeData,
    );
  }
}

extension ButtonStyleExt on ButtonStyle {
  ButtonStyle setMinimumSize(Size size) {
    return copyWith(
      minimumSize: WidgetStatePropertyAll(
        size,
      ),
    );
  }

  ButtonStyle textColor(Color color) {
    return copyWith(foregroundColor: WidgetStatePropertyAll(color));
  }

  ButtonStyle roundCorner(double radius) {
    return copyWith(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  ButtonStyle fontStyle(TextStyle textStyle) {
    return copyWith(
      textStyle: WidgetStatePropertyAll(
        textStyle,
      ),
    );
  }
}
