// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //first O
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player X',
                            style: myTextStyle,
                          ),
                          Text(
                            exScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player O',
                            style: myTextStyle,
                          ),
                          Text(
                            ohScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              displayExOh[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                        ));
                  }),
            ),
            Expanded(child: Container())
          ],
        ));
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
      } else if (displayExOh[index] == '') {
        displayExOh[index] = 'O';
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //checks first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }
    //checks second row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showinDialog(displayExOh[3]);
    }
    //checks third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showinDialog(displayExOh[6]);
    }
    //checks first column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }
    //checks second column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showinDialog(displayExOh[1]);
    }
    //checks third column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showinDialog(displayExOh[2]);
    }
    //checks 1st diag
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }
    //checks 2nd diag
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showinDialog(displayExOh[6]);
    }
  }

  void _showinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is : ' + winner),
            actions: [  
              ElevatedButton(
                child: Text('Play Again!'),
                onPressed : ()
                {
                  _clearBoard();
                  Navigator.of(context).pop();
                }
              ),
            ],
          );
        });
      if(winner == 'O')
      {
        ohScore+=1;
      }
      else
      {
        exScore+=1;
      }
  }

  void _clearBoard()
  {
    setState(() {
  for(int i=0; i<9; i++)
  {
    displayExOh[i]='';
  }
});
  }
}
