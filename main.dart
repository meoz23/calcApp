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

  void _onButtonPressed(String value) {
    setState(() {
      _input += value;
    });
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
                _input.isEmpty ? "0" : _input,
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
              return Row(
                children: row.map((value) {
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed(value),
                      child: Text(value, style: TextStyle(fontSize: 24)),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
