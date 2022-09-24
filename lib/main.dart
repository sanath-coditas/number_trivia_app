import 'package:flutter/material.dart';
import 'package:number_trivia_app/constants.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: customPrimarySwatch),
      home: const HomeScreen(),
    );
  }
}
