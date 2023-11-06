import 'dart:ui';

import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();

  double _dollars = 0;
  double _euros = 0;
  final double _conversionRate = 1.06;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CIS 3334 Currency Converter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dollars',
            ),
            TextField(controller: dollarTextField),
            ElevatedButton(
                onPressed: () {
                  _dollars = double.parse(dollarTextField.text);
                  _euros = _dollars * _conversionRate;
                  euroTextField.text = _euros.toStringAsFixed(2);
                  print("Convert To Euros Pressed");
                },
                child: const Text("Convert To Euros"),
            ),
            const Text(
              'Euros',
            ),
            TextField(controller: euroTextField,),
            ElevatedButton(
              onPressed: () {
                _euros = double.parse(euroTextField.text);
                _dollars = _euros / _conversionRate;
                dollarTextField.text = _dollars.toStringAsFixed(2);
                print("Convert To Euros Pressed");
              },
              child: const Text("Convert To Dollars"),
            )
          ],
        ),
      ),
    );
  }
}
