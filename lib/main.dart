import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double degre = 0;
  late Timer timer;
  late String result;
  late Random random;
  late int time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    random = Random();
    degre = 0;
    result = "";
  }

  void rotateWheel() {
    time = 3000;
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (time > 0) {
        setState(() {
          degre = random.nextInt(360).toDouble();
        });
        time = time - 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(
                        'assets/images/roulette-8-300.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      width: 50,
                      height: 50,
                      image: AssetImage(
                        'assets/images/roulette-center-300.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: DefaultTextStyle(
              child: Text('Result'),
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
              ),
            ),
          ),
          Transform.rotate(
            angle: 3.14 / 180 * degre,
            child: Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  rotateWheel();
                },
                child: Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
