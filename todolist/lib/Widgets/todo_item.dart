// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box,color: tdBlue),
        title: Text('Check Mail',style: TextStyle(fontSize: 16,color: 
        Colors.black,
        decoration: TextDecoration.lineThrough,
        ),
        ),
        trailing: Container( 
          height: 35,
          width: 35,
          decoration: BoxDecoration( 
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}