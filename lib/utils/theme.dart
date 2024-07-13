import 'package:flutter/material.dart';

class UIcolor {
  // Private constructor
  UIcolor._();

  // Primary colors
  static const Color bg = Color(0xFFFFFFFF);
  static const Color themecolor = Color.fromARGB(255, 14, 77, 95);
}

class UItext {
  UItext._();

  static validateText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  static Widget txt(String text, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, fontWeight: weight, color: UIcolor.themecolor),
    );
  }
}
