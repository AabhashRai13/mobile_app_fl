import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  final double? leftPadding;
  final double? rightPadding;
  final bool? isPhoneNumber;
  final Function? function;
  const CustomSurffixIcon(
      {Key? key,
      required this.svgIcon,
      this.leftPadding,
      this.rightPadding,
      this.isPhoneNumber,
      this.function})
      : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return isPhoneNumber!
        ? SizedBox(
            width: getProportionateScreenWidth(52),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgIcon,
                  height: getProportionateScreenWidth(18),
                ),
                const Text(" +61 |"),
              ],
            ),
          )
        : GestureDetector(
            onTap: function as void Function()?,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                svgIcon,
              ),
            ),
          );
  }
}