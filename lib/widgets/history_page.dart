import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calci/calculator_logic.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorLogic>(context);
    final history = calculator.history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(history[index]),
          );
        },
      ),
    );
  }
}
