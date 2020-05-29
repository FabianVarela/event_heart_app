import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PastEventItem extends StatelessWidget {
  PastEventItem({@required this.item});

  final Event item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextShadow(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.white,
                      ),
                    ),
                  ),
                  CustomTextShadow(
                    item.currentMonth,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: CustomColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
