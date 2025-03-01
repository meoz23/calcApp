import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = "";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        // Reset all values
        _input = "";
        _output = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if ("+-*/".contains(value)) {
        num1 = double.tryParse(_input) ?? 0;
        operator = value;
        _input = "";
      } else if (value == "=") {
        num2 = double.tryParse(_input) ?? 0;
        switch (operator) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "*":
            _output = (num1 * num2).toString();
            break;
          case "/":
            _output = (num1 / num2).toString();
            break;
        }
        _input = "";
      } else {
        _input += value;
      }
    });
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(value),
        child: Text(value, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output.isEmpty ? _input : _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              ["7", "8", "9", "/"],
              ["4", "5", "6", "*"],
              ["1", "2", "3", "-"],
              ["C", "0", "=", "+"],
            ].map((row) {
              return Row(children: row.map(_buildButton).toList());
            }).toList(),
          ),
        ],
      ),
    );
  }
}
