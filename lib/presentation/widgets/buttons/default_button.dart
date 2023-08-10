import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
    required this.loading,
    this.buttonColor,
    this.height,
    this.textColor,
    this.width,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final Function? press;
  final bool loading;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonColor ?? ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press as void Function()?,
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize ?? getProportionateScreenWidth(20),
                  color: textColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
