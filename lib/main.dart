import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calci/widgets/calculator_display.dart';
import 'package:calci/widgets/calculator_button.dart';
import 'package:calci/calculator_logic.dart';
import 'package:calci/widgets/history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorLogic(),
      child: MaterialApp(
        title: 'Flutter Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Calculator'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorLogic>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF2D3035), // Dark Charcoal background
      body: Column(
        children: <Widget>[
          // Display Area
          Expanded(
            flex: 1,
            child: CalculatorDisplay(
              expression: calculator.expression,
              result: calculator.result,
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
                      Expanded(child: CalculatorButton(text: 'C', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('C'))),
                      Expanded(child: CalculatorButton(text: 'MC', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('MC'))),
                      Expanded(child: CalculatorButton(text: '%', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('%'))),
                      Expanded(child: CalculatorButton(text: '÷', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('÷'))),
                    ],
                  ),
                ),
                // Row 2
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: CalculatorButton(text: '7', onPressed: () => calculator.onButtonPressed('7'))),
                      Expanded(child: CalculatorButton(text: '8', onPressed: () => calculator.onButtonPressed('8'))),
                      Expanded(child: CalculatorButton(text: '9', onPressed: () => calculator.onButtonPressed('9'))),
                      Expanded(child: CalculatorButton(text: 'x', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('x'))),
                    ],
                  ),
                ),
                // Row 3
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: CalculatorButton(text: '4', onPressed: () => calculator.onButtonPressed('4'))),
                      Expanded(child: CalculatorButton(text: '5', onPressed: () => calculator.onButtonPressed('5'))),
                      Expanded(child: CalculatorButton(text: '6', onPressed: () => calculator.onButtonPressed('6'))),
                      Expanded(child: CalculatorButton(text: '-', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('-'))),
                    ],
                  ),
                ),
                // Row 4
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: CalculatorButton(text: '1', onPressed: () => calculator.onButtonPressed('1'))),
                      Expanded(child: CalculatorButton(text: '2', onPressed: () => calculator.onButtonPressed('2'))),
                      Expanded(child: CalculatorButton(text: '3', onPressed: () => calculator.onButtonPressed('3'))),
                      Expanded(child: CalculatorButton(text: '+', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('+'))),
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
                        child: CalculatorButton(text: '0', onPressed: () => calculator.onButtonPressed('0')),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '.', onPressed: () => calculator.onButtonPressed('.')),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '=', color: const Color(0xFFFF8C00), textColor: Colors.white, onPressed: () => calculator.onButtonPressed('=')),
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
