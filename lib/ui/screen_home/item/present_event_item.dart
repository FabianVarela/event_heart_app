import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PresentEventItem extends StatelessWidget {
  PresentEventItem({@required this.item, this.onPress});

  final Event item;
  final Function(Event event) onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(item),
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: item.color,
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.currentMonth,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
