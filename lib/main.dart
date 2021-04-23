import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMIcalci());

class BMIcalci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            //color: Color(0xFFF29C1A), some kind of orange.
            color: Colors.tealAccent,
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
