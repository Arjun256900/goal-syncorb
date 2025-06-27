import 'package:flutter/material.dart';
import 'package:goal/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF0F0F0),textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color.fromARGB(132, 0, 0, 0), // cursor color
      selectionColor: const Color.fromARGB(104, 3, 91, 205))),
    );
  }
}
