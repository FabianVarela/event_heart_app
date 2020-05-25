import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  HeartAnimation({
    @required this.child,
  });

  final Widget child;

  @override
  _HeartAnimationState createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _size = 20;

  final double _augmentedSize = 250;
  final double _lowerBound = 0.7;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
      lowerBound: _lowerBound,
    );

    _controller.forward();
    _controller.addStatusListener((AnimationStatus status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    });

    _controller.addListener(() {
      setState(() => _size = _controller.value * _augmentedSize);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: widget.child,
        height: _size,
      ),
    );
  }
}
