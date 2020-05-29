import 'package:event_heart_app/ui/common/custom_text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownFilter extends StatefulWidget {
  CustomDropDownFilter({
    @required this.filters,
    @required this.currentFilter,
    @required this.setCurrentFilter,
    this.fontSize = 18,
    this.hintText = '',
  });

  final List<String> filters;
  final String currentFilter;
  final Function(String filter) setCurrentFilter;
  final double fontSize;
  final String hintText;

  @override
  _CustomDropDownFilterState createState() => _CustomDropDownFilterState();
}

class _CustomDropDownFilterState extends State<CustomDropDownFilter> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        value: widget.currentFilter,
        onChanged: widget.setCurrentFilter,
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black),
        items: widget.filters
            .map((String item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        selectedItemBuilder: (_) => widget.filters
            .map((String value) => CustomTextShadow(
                  widget.currentFilter ?? widget.hintText,
                  style: TextStyle(color: Colors.white),
                ))
            .toList(),
      ),
    );
  }
}
