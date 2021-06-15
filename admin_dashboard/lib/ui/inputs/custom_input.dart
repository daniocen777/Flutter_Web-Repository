import 'package:flutter/material.dart';

class CustomInput {
  static InputDecoration authInputDecoration(
          {required String hint,
          required String label,
          required IconData iconData}) =>
      InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
          hintText: hint,
          labelText: label,
          prefix: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData, color: Colors.grey),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey));
}
