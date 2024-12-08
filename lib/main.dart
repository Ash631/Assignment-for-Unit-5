import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int result = 0;

  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  void calculate(String operation) {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 ~/ num2; 
          } else {
            result = 0; 
          }
          break;
      }
    });
  }

  void clear() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(  // Add padding for better spacing
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Add Row
            buildRow('+'),
            buildRow('-'),
            buildRow('*'),
            buildRow('/'),

             ElevatedButton(
               onPressed: clear,
               child: const Text("Clear"),
             ),



          ],
        ),
      ),
    );
  }


  Row buildRow(String operation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            controller: num1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "First Number"),
          ),
        ),
        Text(' $operation '),
        Expanded(
          child: TextField(
            controller: num2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Second Number"),
          ),
        ),
        IconButton(
          onPressed: () => calculate(operation),
          icon: const Icon(Icons.calculate),
        ),
        Text(' = $result'),
      ],
    );
  }
}