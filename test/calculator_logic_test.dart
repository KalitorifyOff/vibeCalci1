import 'package:flutter_test/flutter_test.dart';
import 'package:calci/calculator_logic.dart';

void main() {
  group('Calculator Logic', () {
    late CalculatorLogic calculatorLogic;

    setUp(() {
      calculatorLogic = CalculatorLogic();
    });

    test('Number input works correctly', () {
      calculatorLogic.onButtonPressed('1');
      expect(calculatorLogic.result, '1');
      calculatorLogic.onButtonPressed('2');
      expect(calculatorLogic.result, '12');
    });

    test('Decimal point input works correctly', () {
      calculatorLogic.onButtonPressed('1');
      calculatorLogic.onButtonPressed('.');
      expect(calculatorLogic.result, '1.');
      calculatorLogic.onButtonPressed('2');
      expect(calculatorLogic.result, '1.2');
      calculatorLogic.onButtonPressed('.'); // Should not add another decimal
      expect(calculatorLogic.result, '1.2');
    });

    test('Addition works correctly', () {
      calculatorLogic.onButtonPressed('5');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('3');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '8');
    });

    test('Subtraction works correctly', () {
      calculatorLogic.onButtonPressed('10');
      calculatorLogic.onButtonPressed('-');
      calculatorLogic.onButtonPressed('4');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '6');
    });

    test('Multiplication works correctly', () {
      calculatorLogic.onButtonPressed('6');
      calculatorLogic.onButtonPressed('x');
      calculatorLogic.onButtonPressed('7');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '42');
    });

    test('Division works correctly', () {
      calculatorLogic.onButtonPressed('20');
      calculatorLogic.onButtonPressed('÷');
      calculatorLogic.onButtonPressed('4');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '5');
    });

    test('Division by zero returns Error', () {
      calculatorLogic.onButtonPressed('10');
      calculatorLogic.onButtonPressed('÷');
      calculatorLogic.onButtonPressed('0');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, 'Error');
    });

    test('Percentage works correctly', () {
      calculatorLogic.onButtonPressed('50');
      calculatorLogic.onButtonPressed('%');
      expect(calculatorLogic.result, '0.5');
    });

    test('Clear (C) button works correctly', () {
      calculatorLogic.onButtonPressed('123');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('456');
      calculatorLogic.onButtonPressed('C');
      expect(calculatorLogic.result, '0');
      expect(calculatorLogic.expression, '');
      expect(calculatorLogic.firstOperand, 0.0);
      expect(calculatorLogic.operator, '');
    });

    test('Backspace button works correctly', () {
      calculatorLogic.onButtonPressed('123');
      calculatorLogic.onButtonPressed('⌫');
      expect(calculatorLogic.result, '12');
      calculatorLogic.onButtonPressed('⌫');
      expect(calculatorLogic.result, '1');
      calculatorLogic.onButtonPressed('⌫');
      expect(calculatorLogic.result, '0');
      calculatorLogic.onButtonPressed('⌫'); // Should remain 0
      expect(calculatorLogic.result, '0');
    });

    test('Memory Clear (MC) button works correctly', () {
      calculatorLogic.onButtonPressed('10');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('5');
      calculatorLogic.onButtonPressed('MC');
      expect(calculatorLogic.firstOperand, 0.0);
      expect(calculatorLogic.operator, '');
      expect(calculatorLogic.expression, '');
      expect(calculatorLogic.result, '0');
    });

    test('Chained operations work correctly', () {
      calculatorLogic.onButtonPressed('2');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('3');
      calculatorLogic.onButtonPressed('+');
      expect(calculatorLogic.result, '5');
      calculatorLogic.onButtonPressed('4');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '9');
    });

    test('Operations with negative results work correctly', () {
      calculatorLogic.onButtonPressed('5');
      calculatorLogic.onButtonPressed('-');
      calculatorLogic.onButtonPressed('10');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '-5');
    });

    test('Starts new calculation after pressing equals', () {
      calculatorLogic.onButtonPressed('1');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('2');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '3');
      calculatorLogic.onButtonPressed('4');
      expect(calculatorLogic.result, '4');
    });

    test('Pressing an operator after a calculation uses the result as the first operand', () {
      calculatorLogic.onButtonPressed('1');
      calculatorLogic.onButtonPressed('+');
      calculatorLogic.onButtonPressed('2');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '3');
      calculatorLogic.onButtonPressed('+');
      expect(calculatorLogic.expression, '3 +');
      calculatorLogic.onButtonPressed('4');
      calculatorLogic.onButtonPressed('=');
      expect(calculatorLogic.result, '7');
    });
  });
}
