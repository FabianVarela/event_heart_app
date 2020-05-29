import 'package:event_heart_app/model/city.dart';
import 'package:flutter/material.dart';

class CustomDropDownCity extends StatefulWidget {
  CustomDropDownCity({
    @required this.cities,
    @required this.currentCity,
    @required this.setCurrentCity,
    this.fontSize = 18,
    this.hintText = '',
  });

  final List<City> cities;
  final City currentCity;
  final Function(City city) setCurrentCity;
  final double fontSize;
  final String hintText;

  @override
  _CustomDropDownCityState createState() => _CustomDropDownCityState();
}

class _CustomDropDownCityState extends State<CustomDropDownCity> {
  List<DropdownMenuItem<City>> _cityList;

  @override
  Widget build(BuildContext context) {
    _cityList = _getCityList();

    final DropdownMenuItem<City> item = _cityList.firstWhere(
      (DropdownMenuItem<City> c) => c.value.id == widget.currentCity.id,
      orElse: () => null,
    );

    return DropdownButton<City>(
      isExpanded: true,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
        size: 30,
      ),
      iconSize: 18,
      hint: Text(
        widget.hintText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: widget.fontSize,
        ),
      ),
      value: item?.value,
      items: _cityList,
      onChanged: widget.setCurrentCity,
    );
  }

  List<DropdownMenuItem<City>> _getCityList() {
    return widget.cities.map((City item) {
      return DropdownMenuItem<City>(
        value: item,
        child: Container(
          child: Text(
            item.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: widget.fontSize,
              color: item.id == widget.currentCity.id
                  ? Colors.grey
                  : Colors.black,
            ),
          ),
        ),
      );
    }).toList();
  }
}
