import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.red,
    appBar: AppBar(
      title: const Center(
          child: Text(
        'Dicee',
        style: TextStyle(
          color: Colors.white,
        ),
      )),
      backgroundColor: Colors.red,
    ),
    body: const DicePage(),
  )));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$leftDiceNumber.png'))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$rightDiceNumber.png'))),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 70.0,
          width: 300.0,
          child: ElevatedButton(
              onPressed: () {
                this.rollDice();
              },
              child: const Text(
                'Roll The Dice!',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              )),
        ),
      )
    ]);
  }
}
