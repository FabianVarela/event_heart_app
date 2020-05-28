import 'dart:ui';

import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/animation/interval_column_animation.dart';
import 'package:event_heart_app/ui/common/custom_app_bar.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  @override
  _MuState createState() => _MuState();
}

class _MuState extends State<MyEvents> {
  final List<Event> _saveEvent =
      events.where((Event item) => item.isSelected).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/my_events_background.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Stack(
              children: <Widget>[
                CustomAppBar(),
                Padding(
                  padding: EdgeInsets.only(top: 110, left: 20, right: 20),
                  child: IntervalColumnAnimation(
                    duration: Duration(milliseconds: 1000),
                    height: MediaQuery.of(context).size.height,
                    children: <Widget>[
                      _setMessage(),
                      _setTitle(),
                      _setList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _setMessage() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Center(
              child: CustomTextShadow(
                'Esperamos los disfrutes'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _setTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        'Tus eventos',
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _setList() {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: ListView.builder(
        itemCount: _saveEvent.length,
        padding: EdgeInsets.zero,
        itemBuilder: (_, int index) {
          final Event item = _saveEvent[index];

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
                  colors: [Colors.white, item.color],
                  begin: Alignment.topLeft,
                  end: Alignment(.8, 0),
                  tileMode: TileMode.mirror
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
                            color: Colors.white,
                          ),
                        ),
                        CustomTextShadow(
                          '${Utils.getDayMonth(item.eventDates[0].date)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    CustomTextShadow(
                                      item.eventDates[0].place,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                                    color: Colors.white,
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
        },
      ),
    );
  }
}
