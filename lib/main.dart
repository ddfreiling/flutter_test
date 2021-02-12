import 'dart:math';
import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final double radius;
  final Color color;
  final bool? ripe;

  Fruit(this.name, this.radius, this.color, {this.ripe});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  final title = "Test Page";

  @override
  _TestPageState createState() => _TestPageState(1, 100);
}

class _TestPageState extends State<TestPage> {
  _TestPageState(this.a, this.b);

  final int a;
  final int b;
  List<Fruit> _fruits = [
    Fruit("apple", 4.0, Colors.green, ripe: false),
    Fruit("grape", 1.0, Colors.green, ripe: true),
    Fruit("watermelon", 10.0, Colors.green),
    Fruit("tomato", 4.0, Colors.red, ripe: true),
    Fruit("orange", 4.0, Colors.orange, ripe: true),
  ];
  String _output = "";

  void _filterFruits() {
    setState(() {
      _output = _fruits
          .where((f) {
            return f.color == Colors.green;
          })
          .where((f) => f.ripe ?? true)
          .map((f) => "${f.name}: ${4 / 3 * pi * pow(f.radius, 3)}")
          .reduce((result, element) => '$result\n$element');
    });
  }

  void showResult(int res) {
    setState(() {
      _output = "$a + $b = ${res}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Output:', style: Theme.of(context).textTheme.headline4),
            Text(_output),
            ElevatedButton(child: Text('Show fruits'), onPressed: _filterFruits),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int a = 1;
          int b = 5;
          int res = a + b;
          showResult(res);
        },
        child: Icon(Icons.question_answer),
      ),
    );
  }
}
