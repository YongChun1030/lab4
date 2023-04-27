import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/newbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  AudioPlayer audioPlayer = AudioPlayer();
  int _dice1Value = 1;
  int _dice2Value = 1;

  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    } 

  void _rollDice() async {
      setState(() {
        _dice1Value = Random().nextInt(6) + 1;
        _dice2Value = Random().nextInt(6) + 1;
      });
      await audioPlayer.play('audio/roll_dice_sound.mp3');
}

 @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/diceeLogo.png',
                  height: 300.0,
                  width: 300.0,
                ),
                SizedBox(width: 10.0),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Image.asset(
                    'images/dice$_dice1Value.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                Image.asset(
                  'images/dice$_dice2Value.png',
                  height: 200.0,
                  width: 200.0,
                ),
              ],
            ),
          SizedBox(height: 40.0),
          ElevatedButton(
              onPressed: _rollDice,
              child: Text(
                'Roll the Dice',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
  ),
),
        ],
      ),
    );
  }
}
