import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SocialCard extends StatelessWidget {
  const SocialCard({Key? key, this.icon, this.press, required this.loading})
      : super(key: key);

  final String? icon;
  final Function? press;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? () {} : press as void Function()?,
      child: Container(
        height: getProportionateScreenHeight(70),
        width: getProportionateScreenWidth(30),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 10,
              blurRadius: 30,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: ColorManager.primary,
              ))
            : SvgPicture.asset(
                icon!,
              ),
      ),
    );
  }
}
