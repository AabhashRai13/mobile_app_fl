import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final labelStyle = TextStyle(
  fontSize: getProportionateScreenWidth(8),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1,
);
final topicStyleWeb = TextStyle(
  fontSize: getProportionateScreenWidth(6),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1,
);
final topicStyleMobile = TextStyle(
  fontSize: getProportionateScreenWidth(12),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1,
);
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: ColorManager.kTextColor),
  );
}
