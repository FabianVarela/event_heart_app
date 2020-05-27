import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final List<dynamic> currentList;
  final int currentIndex;

  DotIndicator({this.currentIndex = 0, this.currentList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _map<Widget>(
        currentList,
            (int index, _) {
          return Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? Colors.red
                  : Colors.grey,
            ),
          );
        },
      ),
    );
  }

  /// Private functions
  List<T> _map<T>(List<dynamic> list, Function handler) {
    final List<T> result = <T>[];

    for (int i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
