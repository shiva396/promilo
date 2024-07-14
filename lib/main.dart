import 'package:flutter/material.dart';
import 'package:promilo/pages/login.dart';


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
        // colorScheme: ColorScheme.light(onPrimary: UIcolor.bg),
        useMaterial3: true,
        // scaffoldBackgroundColor: UIcolor.bg,
        // appBarTheme: AppBarTheme(
            // backgroundColor: UIcolor.bg, foregroundColor: UIcolor.bg),
      ),
      home: const LoginScreen(),
    );
  }
}
