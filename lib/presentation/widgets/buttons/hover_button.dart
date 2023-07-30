import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/size_config.dart';

class HoverButton extends StatefulWidget {
  final String hoverText;
  final String? image;
  final IconData? icon;
  final Color color;
  final Function? function;
  const HoverButton(
      {super.key,
      required this.hoverText,
      this.image,
      this.icon,
      required this.color,
      this.function,
      });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
            top: (isHover) ? 5 : 10, bottom: !(isHover) ? 5 : 10),
        child: InkWell(
          onTap: widget.function as void Function()?,
          child: isHover
              ? HoverWidget(
                  hoverText: widget.hoverText,
                  image: widget.image,
                  icon: widget.icon,
                  color: widget.color,
                )
              : widget.image != null
                  ? ImageIcon(
                      AssetImage(widget.image!),
                      color: widget.color,
                    )
                  : Icon(
                      widget.icon,
                      color: widget.color,
                    ),
          onHover: (val) {
            setState(() {
              isHover = val;
            });
          },
        ),
      ),
    );
  }
}

class HoverWidget extends StatefulWidget {
  final String hoverText;
  final String? image;
  final IconData? icon;
  final Color color;
  const HoverWidget(
      {Key? key,
      required this.hoverText,
      this.image,
      this.icon,
      required this.color})
      : super(key: key);

  @override
  HoverWidgetState createState() => HoverWidgetState();
}

class HoverWidgetState extends State<HoverWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message: widget.hoverText,
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        showDuration: const Duration(seconds: 10),
        decoration: ShapeDecoration(
          color: ColorManager.primary,
          shape: const ToolTipCustomShape(),
        ),
        textStyle: const TextStyle(color: Colors.white),
        preferBelow: false,
        verticalOffset: 20,
        child: widget.image != null
            ? ImageIcon(
                AssetImage(widget.image!),
                color: widget.color,
              )
            : Icon(
                widget.icon,
                color: widget.color,
              ),
      ),
    );
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 9)))
      ..moveTo(rect.bottomCenter.dx - 7, rect.bottomCenter.dy)
      ..relativeLineTo(7, 20)
      ..relativeLineTo(7, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
