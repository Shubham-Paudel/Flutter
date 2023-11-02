// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todolist/constants/Colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(
        
        appBar: AppBar(
            backgroundColor: tdBGColor,
            title: Row(
              children: [
                Icon(
                  Icons.menu,
                  color: tdBlack,
                   size: 30),
                   Container( 
                    height: 40,
                    width: 40,
                    child: ClipRRect(child: Image.asset('assets/images/mypic.jpg'),)
                   )
              ],
            )),
        body: Container(
          child: Text('This is home screen'),
        )));
  }
}
