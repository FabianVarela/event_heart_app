import 'dart:ui';

import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/animation/interval_column_animation.dart';
import 'package:event_heart_app/ui/common/custom_app_bar.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/ui/screen_my_event/item/my_event_item.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
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
      backgroundColor: CustomColors.grey,
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
            color: CustomColors.white,
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
                  color: CustomColors.white,
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
          color: CustomColors.white,
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
        itemBuilder: (_, int index) => MyEventItem(item: _saveEvent[index]),
      ),
    );
  }
}
