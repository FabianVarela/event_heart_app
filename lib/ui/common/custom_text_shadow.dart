import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextShadow extends StatelessWidget {
  CustomTextShadow(this.text, {this.maxLines, this.overflow, this.style,});

  final String text;
  final int maxLines;
  final TextOverflow overflow;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 2,
            left: 2,
            child: Text(
              text,
              maxLines: maxLines,
              overflow: overflow,
              style: style.copyWith(
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Text(
              text,
              maxLines: maxLines,
              overflow: overflow,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
