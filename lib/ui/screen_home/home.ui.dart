import 'dart:math';
import 'dart:ui';

import 'package:event_heart_app/model/event.dart';
import 'package:event_heart_app/ui/common/custom_app_bar.dart';
import 'package:event_heart_app/ui/common/custom_button.dart';
import 'package:event_heart_app/ui/common/custom_dropdown_filter.dart';
import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:event_heart_app/ui/common/dot_indicator.dart';
import 'package:event_heart_app/ui/screen_home/item/date_event_item.dart';
import 'package:event_heart_app/ui/screen_home/item/past_event_item.dart';
import 'package:event_heart_app/ui/screen_home/item/present_event_item.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

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
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _currentIndex = Random().nextInt(_events.length - 1);
    _currentEvent = _events[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: CustomColors.grey,
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
                  _setBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
        child: Column(
          children: <Widget>[
            _setComing(),
            _setTitle(),
            AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: <Widget>[
                  if (!_isShowingDetails) _setEventList(),
                  if (_isShowingDetails) _setDetailEvent(),
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
          icon: Icon(Icons.arrow_back, size: 30, color: CustomColors.grey),
        ),
        if (!_isShowingDetails)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Center(
                child: CustomTextShadow(
                  'Evento próximo',
                  style: TextStyle(fontSize: 18, color: CustomColors.white),
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
          color: CustomColors.white,
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
            onPressed: () {
              _setTransitionOpacity();
              _showDetails(true);
            },
            text: 'Ver Fechas',
            backgroundColor: CustomColors.red,
            textColor: CustomColors.white,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Boletos',
            backgroundColor: CustomColors.white,
            textColor: CustomColors.black,
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
            itemBuilder: (_, int index) => PresentEventItem(
              item: _events[index],
              onPress: (Event event) => setState(() => _currentEvent = event),
            ),
          ),
        ),
        filter: CustomDropDownFilter(
          currentFilter: _filter,
          filters: _filters,
          setCurrentFilter: (String filter) => setState(() => _filter = filter),
          hintText: 'Seleccione un filtro',
        ),
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
                itemBuilder: (_, int index) => Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: PastEventItem(item: _pastEvents[index]),
                ),
                onPageChanged: (int position) =>
                    setState(() => _currentPastIndex = position),
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
                  color: CustomColors.white,
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
        _setEventDescription(),
      ],
    );
  }

  Widget _setTypeEvent() {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          CustomTextShadow(
            _currentEvent.type,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: CustomColors.white,
            ),
          ),
          Text(
            widget.city,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CustomColors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _setDateEvents() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextShadow(
              'Fechas',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CustomColors.white,
              ),
            ),
          ),
          Container(
            height: 180,
            margin: EdgeInsets.only(top: 30),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: _currentEvent.eventDates.length,
              separatorBuilder: (_, int index) =>
                  Divider(color: CustomColors.grey, height: 1),
              itemBuilder: (_, int index) => DateEventItem(
                item: _currentEvent.eventDates[index],
                onPress: () => Navigator.pushNamed(context, '/profile'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setEventDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          CustomTextShadow(
            _currentEvent.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CustomTextShadow(
              _currentEvent.description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: CustomColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common methods

  Future<bool> _onBackPressed() async {
    _restoreScreen();
    return false;
  }

  void _setTransitionOpacity() {
    setState(() => _visible = !_visible);

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() => _visible = !_visible);
    });
  }

  void _restoreScreen() {
    if (_isShowingDetails) {
      _setTransitionOpacity();
      _showDetails(false);
    } else {
      Navigator.pop(context);
    }
  }

  void _showDetails(bool isShow) {
    Future.delayed(Duration(milliseconds: 500),
        () => setState(() => _isShowingDetails = isShow));
  }
}
