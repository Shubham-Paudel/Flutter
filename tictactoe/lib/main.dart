// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 25);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  int draw = 0;

  static var myNewFont = GoogleFonts.pressStart2p(  
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3), 
  );

  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,fontSize: 15),
  );

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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Player X',
                              style: myNewFontWhite,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              exScore.toString(),
                              style: myNewFontWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Draw',
                              style: myNewFontWhite,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              draw.toString(),
                              style: myNewFontWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Player O',
                              style: myNewFontWhite,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              ohScore.toString(),
                              style: myNewFontWhite
                            ),
                          ),
                        ],
                      ),
                    ),
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
            Expanded(
                child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed:()
                          {  
                            _clearBoard();
                          }
                          ,   
                          child: Text('Clear'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                          onPressed:()
                          {  
                            _clearBoard();
                            draw = 0;
                            exScore = 0;
                            ohScore = 0;
                          }
                          ,   
                          child: Text('Reset'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'TIC-TAC-TOE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Made By: Shubham Raj Paudel',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 149, 145, 145),
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]),
            ))
          ],
        ));
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes++;
      } else if (displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes++;
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
    } else if (filledBoxes == 9) {
      _showDrawDialog();
      draw++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text('Draw'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text('Play Again!'),
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  void _showinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text('Winner is : ' + winner),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Play Again!'),
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
    if (winner == 'O') {
      ohScore += 1;
    } else {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
      filledBoxes = 0;
    });
  }
}
