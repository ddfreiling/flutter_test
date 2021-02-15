import 'dart:math';
import 'package:flutter/material.dart';

/**
 * Spørgsmål:
 * 
 * 1. Beskriv denne lille Flutter app på en overordnet måde. Hvad består den af?
 * 2. Hvad sker der når brugeren trykker på den "floating action button" ?
 * 3. Hvad sker der når brugeren trykker på knappen placeret midt på skærmen ?
 *    - Beskriv Fruit typen.
 *    - Beskriv hvordan frugterne filtreres og mappes før de præsenteres.
 *    - Hvordan kunne koden til dette forbedres?
 * 4. Forskel på StatelessWidget og StatefulWidget
 * 5. Betyder det noget om en metode starter med underscore fx. _metodeNavn ?
 */

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
    Fruit("grape", 2.0, Colors.green, ripe: true),
    Fruit("watermelon", 10.0, Colors.green),
    Fruit("tomato", 4.0, Colors.red, ripe: true),
    Fruit("orange", 5.0, Colors.orange, ripe: true),
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
          int a = 2;
          int b = 20;
          showResult(a + b);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
