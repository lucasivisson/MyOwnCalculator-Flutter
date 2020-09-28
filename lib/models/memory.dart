import 'package:math_expressions/math_expressions.dart';

class Memory {
  String _equation = '0';
  String _result = '0';
  String expression = '';

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
    } else if (command == '⌫') {
      _deleteEquation();
    } else if (command == '=') {
      _finalResult();
    } else {
      _typing(command);
    }
  }

  _allClear() {
    _equation = '0';
    _result = '0';
  }

  _deleteEquation() {
    _equation = _equation.substring(0, _equation.length - 1);
    if (_equation == '') {
      _equation = '0';
    }
  }

  _finalResult() {
    expression = _equation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser p = new Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();
      _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } catch (e) {
      _result = "Error";
    }
  }

  _typing(String command) {
    if (_equation == '0') {
      _equation = command;
    } else {
      _equation += command;
    }
  }

  String get equation {
    return _equation;
  }

  String get result {
    return _result;
  }
}
