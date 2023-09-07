import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class NotificationTiles extends StatelessWidget {
  final String? title, subtitle;
  final Function? onTap;
  final bool? enable;
  const NotificationTiles({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.logo), fit: BoxFit.cover))),
      title: Text(title!, style: TextStyle(color: ColorManager.kTextColor)),
      subtitle:
          Text(subtitle!, style: TextStyle(color: ColorManager.kTextColor)),
      onTap: onTap as void Function()?,
      enabled: enable!,
    );
  }
}