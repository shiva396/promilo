import 'package:flutter/material.dart';

class UIcolor {
  // Private constructor
  UIcolor._();

  // Primary colors
  static const Color bg = Color(0xFFFFFFFF);
}

class UItext {
  UItext._();

  static validateText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
