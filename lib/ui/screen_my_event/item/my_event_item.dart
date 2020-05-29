import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:event_heart_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MyEventItem extends StatelessWidget {
  MyEventItem({@required this.item});

  final Event item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 15),
      //color: item.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.white, item.color],
            begin: Alignment.topLeft,
            end: Alignment(.8, 0),
            tileMode: TileMode.mirror,
          ),
        ),
        height: 150,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 30,
              top: 20,
              child: Column(
                children: <Widget>[
                  CustomTextShadow(
                    Utils.getMonthString(item.eventDates[0].date),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.white,
                    ),
                  ),
                  CustomTextShadow(
                    '${Utils.getDayMonth(item.eventDates[0].date)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 30,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomTextShadow(
                                '${Utils.getDayString(item.eventDates[0].date)} ${Utils.getHourString(item.eventDates[0].date)}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.white,
                                ),
                              ),
                              CustomTextShadow(
                                item.eventDates[0].place,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomTextShadow(
                            'Eliminar'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
