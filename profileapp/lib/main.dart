import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Profile App",
    home: Scaffold(appBar: AppBar(
      centerTitle: true,
      title: Text("Profile App")
      ,),
      body: Column(children: [
       // SizedBox(height: 10),
        Center(child: Image.network("https://cdn.dribbble.com/users/6229959/screenshots/14421439/media/1d3513f47589f4aa40ac6d3064d436bd.png?resize=1000x750&vertical=center", height: 300, width: 500)),
        SizedBox(height: 10),
        Text('Name: Roronoa Zoro'),
        
      ],),
      )
    ,));
}
