// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Score App",
      home: ScoreHome(),
    );
  }
}

class ScoreHome extends StatefulWidget {
  const ScoreHome({super.key});

  @override
  State<ScoreHome> createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome> {
  int number = 0;

  void increasenumber() {
    setState(() {
      number++;
    });
  }

  void decreasenumber() {
    setState(() {
      number--;
    });
  }

  void resetnumber() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score Changer"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetnumber,
        child: Icon(Icons.restore_outlined),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Center(
            child: Text("Score is",
                style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
              child: Text(number.toString(),
                  style: TextStyle(
                      color: Colors.green[1000],
                      fontSize: 125,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: increasenumber,
                child: Text('Increase'),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: decreasenumber,
                child: Text('Decrease'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
