// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'barriers.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double birdHeight = 0.1;
  double birdWidth = 0.1;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

  static List<double> barrierX = [2, 2+1.5, 2+1.5+1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [  
    [0.6, 0.4],
    [0.4,0.6],
  ];

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void moveMap()
  {
    for(int i = 0; i < barrierX.length; i++)
    {
      setState(() {
        barrierX[i] -= 0.05;
         if(barrierX[i] < -1.5)
      {
        barrierX[i] += 3; 
      }
      });

      
    }
  }
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      
      height = -4.9 * time * time + 2.5 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }

      moveMap();

      time += 0.05;
    });
  }

  

  bool birdIsDead()
  {
     if (birdYaxis > 1 || birdYaxis <-1) {
        return true;
      }
      for(int i=0; i<barrierX.length;i++)
      {
        if(barrierX[i] <= birdWidth && barrierX[i] + barrierWidth >= -birdWidth && (birdYaxis <= -1 + barrierHeight [i][0] || birdYaxis + birdHeight >= 1 - barrierHeight[i][1]))
        {
          return true;
        }
      }
      return false;
  }

  void resetGame()
  {
    Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void _showDialog()
  {
    showDialog(barrierDismissible: false,context: context,
     builder: (BuildContext context)
     {
      return AlertDialog( 
        backgroundColor: Colors.blue,
        title: Center(  
          child: Text(
            'G A M E  O V E R' ,
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [  
          GestureDetector(  
            onTap: ()
            {
              resetGame();
            },
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(5),
              child: Container( 
                padding: EdgeInsets.all(7),
                color: Colors.green[800],
                child: Text('PLAY AGAIN!',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
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
              flex: 4,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      MyBird(birdHeight: birdHeight, birdWidth: birdWidth,birdYaxis: birdYaxis,),
                       Container(  
                    alignment: Alignment(0,-0.4),
                    child:gameHasStarted?Text("") : Text('T A P  T O  P L A Y',style: TextStyle(color: Colors.white,fontSize: 40),),),
                    MyBarrier(  
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][0],
                      isThisBottomBarrier: false,
                    ),
                    MyBarrier(  
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][1],
                      isThisBottomBarrier: true,
                    ),
                    MyBarrier(  
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][0],
                      isThisBottomBarrier: false,
                    ),
                     MyBarrier(  
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][1],
                      isThisBottomBarrier: true,
                    ),
                  ],       
                  ),
                ),
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
                    "CREATED BY:",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "SHUBHAM RAJ PAUDEL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ]),
          ))
        ]),
      ),
    );
  }
}
