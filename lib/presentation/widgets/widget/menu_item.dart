import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Function? press;
  const MenuItem({super.key, this.title, this.isActive, this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: Column(
        children: [
          InkWell(
            onTap: press as void Function()?,
            child: Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive! ? ColorManager.primary : Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          isActive!
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}