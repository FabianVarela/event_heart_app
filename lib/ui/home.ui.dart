import 'dart:math';
import 'dart:ui';

import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/common/custom_app_bar.dart';
import 'package:event_heart_app/ui/common/custom_button.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/ui/common/dot_indicator.dart';
import 'package:event_heart_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUI extends StatefulWidget {
  HomeUI({@required this.city});

  final String city;

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final List<Event> _events = events;
  final List<Event> _pastEvents = pastEvents;

  Event _currentEvent;
  int _currentIndex = 0;
  int _currentPastIndex = 0;

  List<String> _filters = <String>['Por fecha', 'Orden alfabético'];
  String _filter;

  bool _isShowingDetails = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = Random().nextInt(_events.length - 1);
    _currentEvent = _events[_currentIndex];

    _filter = 'Por fecha';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: <Widget>[
            Image.asset(
              _currentEvent.imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Stack(
                children: <Widget>[
                  CustomAppBar(),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 120, left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          _setComing(),
                          _setTitle(),
                          if (!_isShowingDetails) _setEventList(),
                          if (_isShowingDetails) _setDetailEvent(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setComing() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: _restoreScreen,
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.grey,
          ),
        ),
        if (!_isShowingDetails)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Center(
                child: CustomTextShadow(
                  'Evento próximo',
                  style: TextStyle(
                    fontSize: 18,
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
      padding: EdgeInsets.only(top: 30),
      child: CustomTextShadow(
        _currentEvent.name,
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Event List

  Widget _setEventList() {
    return Column(
      children: <Widget>[
        _setButtons(),
        _setPresentEvents(),
        _setPastEvents(),
      ],
    );
  }

  Widget _setButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomButton(
            onPressed: () => setState(() => _isShowingDetails = true),
            text: 'Ver Fechas',
            backgroundColor: Colors.red,
            textColor: Colors.white,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Boletos',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _setPresentEvents() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: _setSection(
        'Eventos en tu ciudad',
        Container(
          height: 230,
          child: ListView.builder(
            itemCount: _events?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              final Event item = _events[index];

              return GestureDetector(
                onTap: () => setState(() => _currentEvent = item),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                item.currentMonth,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
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
            },
          ),
        ),
        filter: _setDropDownFilter(),
      ),
    );
  }

  Widget _setDropDownFilter() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _filter,
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        style: GoogleFonts.montserrat(
          fontSize: 14,
          color: Colors.black,
        ),
        isDense: true,
        selectedItemBuilder: (_) {
          return _filters.map((String value) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextShadow(
                _filter,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList();
        },
        onChanged: (String value) => setState(() => _filter = value),
        items: _filters.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }

  Widget _setPastEvents() {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: _setSection(
        'Eventos pasados',
        Stack(
          children: <Widget>[
            Container(
              height: 180,
              child: PageView.builder(
                itemCount: _pastEvents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  final Event item = _pastEvents[index];

                  return Container(
                    //height: 250,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: _setCardPastEvents(item),
                  );
                },
                onPageChanged: (int position) {
                  setState(() => _currentPastIndex = position);
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 2,
              child: DotIndicator(
                currentList: _pastEvents,
                currentIndex: _currentPastIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setCardPastEvents(Event item) {
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomTextShadow(
                    item.currentMonth,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
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

  Widget _setSection(String title, Widget child, {Widget filter}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: CustomTextShadow(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (filter != null) filter,
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: child,
        ),
      ],
    );
  }

  /// Detail Event

  Widget _setDetailEvent() {
    return Column(
      children: <Widget>[
        _setTypeEvent(),
        _setDateEvents(),
        _setEventDetail(),
      ],
    );
  }

  Widget _setTypeEvent() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          CustomTextShadow(
            _currentEvent.type,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            widget.city,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _setDateEvents() {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextShadow(
              'Fechas',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 30),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: _currentEvent.eventDates.length,
              separatorBuilder: (_, int index) => Divider(
                color: Colors.grey,
                height: 1,
              ),
              itemBuilder: (_, int index) {
                final EventDate item = _currentEvent.eventDates[index];

                return ListTile(
                  leading: Column(
                    children: <Widget>[
                      CustomTextShadow(
                        Utils.getMonthString(item.date),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextShadow(
                        '${Utils.getDayMonth(item.date)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    '${Utils.getDayString(item.date)} ${Utils.getHourString(item.date)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: CustomTextShadow(
                    item.place,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Container(
                    width: 110,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                'IR',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 30,
                            width: 70,
                            child: Center(
                              child: Text(
                                'Agendar',
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _setEventDetail() {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          CustomTextShadow(
            _currentEvent.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: CustomTextShadow(
              _currentEvent.description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    _restoreScreen();
    return false;
  }

  void _restoreScreen() {
    if (_isShowingDetails) {
      setState(() => _isShowingDetails = false);
    } else {
      Navigator.pop(context);
    }
  }
}
