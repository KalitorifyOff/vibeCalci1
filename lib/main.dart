import 'package:flutter/material.dart';
import 'package:calci/widgets/calculator_display.dart';
import 'package:calci/widgets/calculator_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = '';
  String _result = '0';
  double _firstOperand = 0.0;
  String _operator = '';
  bool _isOperatorPressed = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      } else if (buttonText == 'C') {
        _expression = '';
        _result = '0';
        _firstOperand = 0.0;
        _operator = '';
        _isOperatorPressed = false;
      } else if (buttonText == 'MC') {
        _firstOperand = 0.0;
        _operator = '';
        _expression = '';
      } else if (buttonText == '⌫') { // Assuming '⌫' for backspace
        if (_result.length > 1) {
          _result = _result.substring(0, _result.length - 1);
        } else {
          _result = '0';
        }
      } else if (buttonText == '.') {
        if (_isOperatorPressed) {
          _result = '0.';
          _isOperatorPressed = false;
        } else if (!_result.contains('.')) {
          _result += buttonText;
        }
      } else if (buttonText == '%') {
        double currentValue = double.parse(_result);
        _result = (currentValue / 100).toString();
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '÷') {
        if (_firstOperand == 0.0 || _isOperatorPressed) {
          _firstOperand = double.parse(_result);
        } else {
          // Perform calculation if an operator was already pressed
          _calculateResult();
        }
        _operator = buttonText;
        _expression = '$_firstOperand $_operator';
        _isOperatorPressed = true;
      } else if (buttonText == '=') {
        _calculateResult();
        _expression = ''; // Clear expression after equals
        _isOperatorPressed = false;
      } else {
        if (_isOperatorPressed) {
          _result = buttonText;
          _isOperatorPressed = false;
        } else if (_result == '0') {
          _result = buttonText;
        } else {
          _result += buttonText;
        }
      }
    });
  }

  void _calculateResult() {
    double secondOperand = double.parse(_result);
    switch (_operator) {
      case '+':
        _result = (_firstOperand + secondOperand).toString();
        break;
      case '-':
        _result = (_firstOperand - secondOperand).toString();
        break;
      case 'x':
        _result = (_firstOperand * secondOperand).toString();
        break;
      case '÷':
        if (secondOperand != 0) {
          _result = (_firstOperand / secondOperand).toString();
        } else {
          _result = 'Error'; // Handle division by zero
        }
        break;
    }
    _firstOperand = double.parse(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3035), // Dark Charcoal background
      body: Column(
        children: <Widget>[
          // Display Area
          Expanded(
            flex: 1,
            child: CalculatorDisplay(
              expression: _expression,
              result: _result,
            ),
          ),
          // Button Grid Area
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                // Row 1
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: 'C', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('C')),
                      CalculatorButton(text: '⌫', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('⌫')),
                      CalculatorButton(text: '%', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('%')),
                      CalculatorButton(text: '÷', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('÷')),
                    ],
                  ),
                ),
                // Row 2
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '7', onPressed: () => _onButtonPressed('7')),
                      CalculatorButton(text: '8', onPressed: () => _onButtonPressed('8')),
                      CalculatorButton(text: '9', onPressed: () => _onButtonPressed('9')),
                      CalculatorButton(text: 'x', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('x')),
                    ],
                  ),
                ),
                // Row 3
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '4', onPressed: () => _onButtonPressed('4')),
                      CalculatorButton(text: '5', onPressed: () => _onButtonPressed('5')),
                      CalculatorButton(text: '6', onPressed: () => _onButtonPressed('6')),
                      CalculatorButton(text: '-', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('-')),
                    ],
                  ),
                ),
                // Row 4
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '1', onPressed: () => _onButtonPressed('1')),
                      CalculatorButton(text: '2', onPressed: () => _onButtonPressed('2')),
                      CalculatorButton(text: '3', onPressed: () => _onButtonPressed('3')),
                      CalculatorButton(text: '+', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => _onButtonPressed('+')),
                    ],
                  ),
                ),
                // Row 5 (with double-width 0 button)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 2, // Double width for 0
                        child: CalculatorButton(text: '0', bigButton: true, onPressed: () => _onButtonPressed('0')),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '.', onPressed: () => _onButtonPressed('.')),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '=', color: const Color(0xFFFF8C00), textColor: Colors.white, onPressed: () => _onButtonPressed('=')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
