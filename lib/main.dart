import 'package:coffeeapp/Screens/Login_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/onBoading_screen.dart';
import 'Screens/Login_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'Inter'),
      initialRoute: 'onBoading',
      routes: {
        'login ': (context) => LoginScreen(),
        'onBoading': (context) => OnBoadingScreen(),
        'home': (context) => HomeScreen(),
      },
    ),
  );
}
