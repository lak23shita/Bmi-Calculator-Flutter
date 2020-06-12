
import'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  //private variable can be used only in this file
  double _bmi;

  String calculateBmi() {
     _bmi = weight / pow(height / 100, 2);
    //this will return a double string which can be fixed according to the size we want to adjust
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under weight';
    }
  }


  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Try exercise more';
    } else if (_bmi >= 18.5) {
      return 'Good job ';
    } else {
      return 'You eat a bit more';
    }
  }
}