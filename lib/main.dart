import 'package:coffeeapp/Screens/Login_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/onBoading_screen.dart';
import 'Screens/Login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'onBoading',
      routes: {
        'login ': (context) => LoginScreen(),
        'onBoading': (context) => OnBoadingScreen(),
      },
    ),
  );
}
