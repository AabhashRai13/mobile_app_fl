import 'package:flutter/material.dart';

class NeoText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;

  const NeoText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              style: TextStyle(
                fontSize: size,
                fontWeight: fontWeight,
                color: color,
                wordSpacing: wordSpacing,
              ),
            )
          : TextButton(
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(
                  fontSize: size,
                  fontWeight: fontWeight,
                  color: color,
                  wordSpacing: wordSpacing,
                ),
              ),
            ),
    );
  }
}