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
              expression: ' ', // Placeholder for previous operation
              result: '0', // Placeholder for current result
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
                      CalculatorButton(text: 'C', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                      CalculatorButton(text: 'MC', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                      CalculatorButton(text: '%', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                      CalculatorButton(text: '÷', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                    ],
                  ),
                ),
                // Row 2
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '7', onPressed: () {}),
                      CalculatorButton(text: '8', onPressed: () {}),
                      CalculatorButton(text: '9', onPressed: () {}),
                      CalculatorButton(text: 'x', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                    ],
                  ),
                ),
                // Row 3
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '4', onPressed: () {}),
                      CalculatorButton(text: '5', onPressed: () {}),
                      CalculatorButton(text: '6', onPressed: () {}),
                      CalculatorButton(text: '-', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
                    ],
                  ),
                ),
                // Row 4
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalculatorButton(text: '1', onPressed: () {}),
                      CalculatorButton(text: '2', onPressed: () {}),
                      CalculatorButton(text: '3', onPressed: () {}),
                      CalculatorButton(text: '+', color: const Color(0xFFA5A9B4), textColor: Colors.white, onPressed: () {}),
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
                        child: CalculatorButton(text: '0', bigButton: true, onPressed: () {}),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '.', onPressed: () {}),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorButton(text: '=', color: const Color(0xFFFF8C00), textColor: Colors.white, onPressed: () {}),
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
