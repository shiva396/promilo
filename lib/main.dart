import 'package:flutter/material.dart';
import 'package:promilo/pages/description.dart';
import 'package:promilo/pages/home.dart';
import 'package:promilo/pages/login.dart';
import 'package:promilo/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: UIcolor.bg,
      ),
      home: const DescriptionScreen(),
    );
  }
}
