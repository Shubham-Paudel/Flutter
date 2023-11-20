// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final size;
  const MyBarrier({super.key, this.size});
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}