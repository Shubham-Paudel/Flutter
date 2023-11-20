// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flappybird/barriers.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

  static double barrierXone = 1;
  static double barrierXtwo = barrierXone + 1.5;
  double barrierXthree = barrierXone + 3;
  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });
      setState(() {
        if (barrierXone < -1.5) {
          barrierXone += 4.7;
        } else {
          barrierXone -= 0.06;
        }
      });
      setState(() {
        if (barrierXtwo < -1.5) {
          barrierXtwo += 4.7;
        } else {
          barrierXtwo -= 0.06;
        }
      });
      setState(() {
        if (barrierXthree < -1.5) {
          barrierXthree += 4.7;
        } else {
          barrierXthree -= 0.06;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                    if (gameHasStarted) {
                      jump();
                    } else {
                      startGame();
                    }
                  },
      child: Scaffold(
        body: Column(children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyBird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: gameHasStarted
                        ? Text("")
                        : Text(
                            'T A P   T O   P L A Y',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, 1.05),
                    child: MyBarrier(
                      size: 250.0,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXone, -1.05),
                    child: MyBarrier(
                      size: 250.0,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, 1.1),
                    child: MyBarrier(
                      size: 200.0,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXtwo, -1.05),
                    child: MyBarrier(
                      size: 350.0,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXthree, -1.1),
                    child: MyBarrier(
                      size: 160.0,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXthree, 1.1),
                    child: MyBarrier(
                      size: 400.0,
                    ),
                  ),
                ],
              )),
          Container(
            height: 15,
            color: Colors.green,
          ),
          Expanded(
              child: Container(
            color: Color.fromARGB(255, 91, 54, 41),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SCORE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BEST",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "10",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ],
              )
            ]),
          ))
        ]),
      ),
    );
  }
}
