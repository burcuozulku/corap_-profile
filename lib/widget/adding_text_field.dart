import 'package:flutter/material.dart';

class AddingTextField extends StatelessWidget {
  final String labeltext;
  final int maxLines;
  final Color color;
  AddingTextField({
    required this.labeltext,
    required this.maxLines,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
          ),
          labelText: labeltext,
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: color))),
    ));
  }
}
