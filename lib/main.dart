import 'package:flutter/material.dart';

import 'constants/color.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: CustomColors.bgLight1,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}