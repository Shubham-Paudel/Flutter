// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final barrierWidth;
  final barrierHeight;
  final barrierX;
  final bool isThisBottomBarrier;
  const MyBarrier({super.key, this.barrierWidth,this.barrierHeight,this.barrierX,required this.isThisBottomBarrier});
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth),
      isThisBottomBarrier ? 1 : -1
      ),
      child: Container( 
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.green,border: Border.all(width: 10,color: const Color.fromARGB(255, 16, 109, 19))),
        width: MediaQuery.of(context).size.width * barrierWidth/2,
        height: MediaQuery.of(context).size.height * 3/4 * barrierHeight / 2,
       ),
      );
  }
}