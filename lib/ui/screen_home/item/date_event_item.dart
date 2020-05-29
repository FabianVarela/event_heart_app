import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:event_heart_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DateEventItem extends StatelessWidget {
  DateEventItem({@required this.item, this.onPress});

  final EventDate item;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: <Widget>[
          CustomTextShadow(
            Utils.getMonthString(item.date),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColors.white,
            ),
          ),
          CustomTextShadow(
            '${Utils.getDayMonth(item.date)}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.white,
            ),
          ),
        ],
      ),
      title: Text(
        '${Utils.getDayString(item.date)} ${Utils.getHourString(item.date)}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CustomColors.red,
        ),
      ),
      subtitle: CustomTextShadow(
        item.place,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: CustomColors.white,
        ),
      ),
      trailing: Container(
        width: 110,
        child: Row(
          children: <Widget>[
            _setGestureButton('IR', CustomColors.white, CustomColors.red, 30),
            SizedBox(width: 10),
            _setGestureButton(
                'Agendar', CustomColors.red, CustomColors.white, 70, onPress),
          ],
        ),
      ),
    );
  }

  Widget _setGestureButton(
      String title, Color background, Color textColor, double width,
      [Function onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 30,
        width: width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
