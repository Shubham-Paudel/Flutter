// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double birdYaxis = 0;

  void jump()
  {
    Timer.periodic(Duration(milliseconds: 500), (timer) { 
      setState(() {
      birdYaxis += 0.1;
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: jump,
            child: AnimatedContainer(
              alignment: Alignment(0, birdYaxis),
              duration: Duration(milliseconds: 0),
              color: Colors.blue,
              child: MyBird(),
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.green,
        ))
      ]),
    );
  }
}
