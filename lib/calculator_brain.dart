import 'dart:math';

// For Men
class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int weight;
  final int height;
  double _bmi; // Underscore specifies that the variable is PRIVATE.

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String mGetResult() {
    if (_bmi >= 25) {
      return 'Overweight :(';
    } else if (_bmi > 18.5) {
      return 'Normal :)';
    } else {
      return 'Underweight :(';
    }
  }

  String mGetInterpretation() {
    if (_bmi >= 25) {
      return "You have a body weight that's more than normal. Try to exercise more.";
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job.';
    } else {
      return "You have a body weight that's less than normal. You should a bit more.";
    }
  }

  String fGetResult() {
    if (_bmi >= 23) {
      return 'Overweight :(';
    } else if (_bmi > 16) {
      return 'Normal :)';
    } else {
      return 'Underweight :(';
    }
  }

  String fGetInterpretation() {
    if (_bmi >= 23) {
      return "You have a body weight that's more than normal. Try to exercise more.";
    } else if (_bmi >= 16) {
      return 'You have a normal body weight. Good Job.';
    } else {
      return "You have a body weight that's less than normal. You should a bit more.";
    }
  }
}
