import 'package:flutter/material.dart';
import 'package:quiz_app/screens/main_home_screen.dart';
import 'package:quiz_app/screens/quiz_result_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: MainHomeScreen()),
    );
  }
}
