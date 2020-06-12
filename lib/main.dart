import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';


void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {             //stateless widget do not depend on mutable state or any other widget other than the buildContext
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21) ,
        // ignore: deprecated_member_use
      ),
      home: InputPage(),
    );
  }
}



