import 'package:flutter/material.dart';

class CalculatorLogic extends ChangeNotifier {
  String _expression = '';
  String _result = '0';
  double _firstOperand = 0.0;
  String _operator = '';
  bool _isOperatorPressed = false;
  bool _isCalculationComplete = false;
  final List<String> _history = [];

  String get expression => _expression;
  String get result => _result;
  double get firstOperand => _firstOperand;
  String get operator => _operator;
  List<String> get history => _history;

  String _formatResult(double result) {
    if (result.truncateToDouble() == result) {
      return result.toInt().toString();
    } else {
      return result.toString();
    }
  }

  void onButtonPressed(String buttonText) {
    if (buttonText == 'C' || buttonText == 'MC') {
      _expression = '';
      _result = '0';
      _firstOperand = 0.0;
      _operator = '';
      _isOperatorPressed = false;
      _isCalculationComplete = false;
    } else if (buttonText == '⌫') {
      if (_result.length > 1) {
        _result = _result.substring(0, _result.length - 1);
      } else {
        _result = '0';
      }
      _isCalculationComplete = false;
    } else if (buttonText == '.') {
      if (_isCalculationComplete) {
        _result = '0.';
        _isCalculationComplete = false;
      } else if (_isOperatorPressed) {
        _result = '0.';
        _isOperatorPressed = false;
      } else if (!_result.contains('.')) {
        _result += buttonText;
      }
    } else if (buttonText == '%') {
      double currentValue = double.parse(_result);
      _result = _formatResult(currentValue / 100);
      _isCalculationComplete = true;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '÷') {
      if (_isCalculationComplete) {
        _isCalculationComplete = false;
      }
      if (_operator.isNotEmpty && !_isOperatorPressed) {
        _calculateResult();
      }
      _firstOperand = double.parse(_result);
      _operator = buttonText;
      _expression = '${_formatResult(_firstOperand)} $_operator';
      _isOperatorPressed = true;
    } else if (buttonText == '=') {
      if (_operator.isNotEmpty) {
        _calculateResult();
        _expression = '';
        _isOperatorPressed = false;
        _isCalculationComplete = true;
        _operator = '';
      }
    } else { // Number buttons
      if (_isCalculationComplete) {
        _result = buttonText;
        _isCalculationComplete = false;
      } else if (_isOperatorPressed) {
        _result = buttonText;
        _isOperatorPressed = false;
      } else if (_result == '0') {
        _result = buttonText;
      } else {
        _result += buttonText;
      }
    }
    notifyListeners();
  }

  void _calculateResult() {
    if (_result == 'Error') return; // Don't calculate if already in error state
    double secondOperand = double.parse(_result);
    String secondOperandStr = _result;
    double tempResultValue = 0;

    switch (_operator) {
      case '+':
        tempResultValue = _firstOperand + secondOperand;
        break;
      case '-':
        tempResultValue = _firstOperand - secondOperand;
        break;
      case 'x':
        tempResultValue = _firstOperand * secondOperand;
        break;
      case '÷':
        if (secondOperand != 0) {
          tempResultValue = _firstOperand / secondOperand;
        } else {
          _result = 'Error'; // Handle division by zero
          notifyListeners();
          return;
        }
        break;
    }

    final historyEntry =
        '${_formatResult(_firstOperand)} $_operator $secondOperandStr = ${_formatResult(tempResultValue)}';
    _history.add(historyEntry);

    _result = _formatResult(tempResultValue);
    if (_result != 'Error') {
      _firstOperand = tempResultValue;
    }
  }
}
