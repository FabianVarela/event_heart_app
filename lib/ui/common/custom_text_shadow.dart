import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextShadow extends StatelessWidget {
  CustomTextShadow(this.text, {this.style});

  final String text;
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
              style: style.copyWith(
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Text(
              text,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
