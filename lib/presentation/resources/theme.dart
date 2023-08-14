import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

final FocusNode myFocusNode = FocusNode();
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: ColorManager.normalBorderColor),
    gapPadding: 10,
  );
  OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: ColorManager.primary),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: ColorManager.primary,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedInputBorder,
    hoverColor: ColorManager.kTextColor,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyLarge: TextStyle(color: ColorManager.kTextColor),
    bodyMedium: TextStyle(color: ColorManager.kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 1,
    iconTheme: IconThemeData(color: ColorManager.primary),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: TextTheme(
      titleLarge: TextStyle(
          color: const Color(0XFF8B8B8B),
          fontSize: getProportionateScreenHeight(20)),
    ).bodyMedium,
    titleTextStyle: TextTheme(
      titleLarge: TextStyle(
          color: Colors.black, fontSize: getProportionateScreenHeight(20)),
    ).titleLarge,
  );
}
