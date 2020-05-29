import 'package:event_heart_app/model/city.dart';
import 'package:event_heart_app/ui/animation/heart.animation.dart';
import 'package:event_heart_app/ui/common/custom_dropdown_city.dart';
import 'package:event_heart_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class SelectCityUI extends StatefulWidget {
  @override
  _SelectCityUIState createState() => _SelectCityUIState();
}

class _SelectCityUIState extends State<SelectCityUI> {
  List<City> _cities = cities;
  City _currentCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/event_heart_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _setHeartAnimation(),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * .08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _setAppName(),
                  _setSloganTitle(),
                  _setCityTitle(),
                  _setDropDownCity(),
                  _setSearchButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setHeartAnimation() {
    return Positioned(
      top: MediaQuery.of(context).size.height * .15,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: HeartAnimation(
          child: Image.asset('assets/images/event_heart_logo.png'),
        ),
      ),
    );
  }

  Widget _setAppName() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _setFragmentText('Event', 70),
          SizedBox(width: 5),
          _setFragmentText('Heart', 70),
        ],
      ),
    );
  }

  Widget _setSloganTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 70),
      child: Text(
        'Los eventos en tus manos',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Dirty Headline',
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget _setCityTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        'Selecciona tu ciudad',
        style: TextStyle(
          fontSize: 18,
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget _setDropDownCity() {
    return Padding(
      padding: EdgeInsets.fromLTRB(70, 0, 70, 20),
      child: CustomDropDownCity(
        cities: _cities ?? <City>[],
        currentCity: _currentCity ?? City(),
        setCurrentCity: (City city) => setState(() => _currentCity = city),
        fontSize: 16,
        hintText: 'Seleccione una ciudad',
      ),
    );
  }

  Widget _setSearchButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: _currentCity == null ? null : _goToHome,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Buscar evento',
                style: TextStyle(
                  fontSize: 18,
                  color: _currentCity == null
                      ? CustomColors.grey
                      : CustomColors.white,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward,
                size: 30,
                color: _currentCity == null
                    ? CustomColors.red.withOpacity(.5)
                    : CustomColors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setFragmentText(String text, double size) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: size, fontFamily: 'Atone'),
        children: <TextSpan>[
          TextSpan(
            text: text.substring(0, 1),
            style: TextStyle(color: CustomColors.red),
          ),
          if (text.length > 1)
            TextSpan(
              text: text.substring(1, text.length),
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
        ],
      ),
    );
  }

  void _goToHome() {
    Navigator.pushNamed(
      context,
      '/home',
      arguments: <String, dynamic>{'city': _currentCity.name},
    );
  }
}
