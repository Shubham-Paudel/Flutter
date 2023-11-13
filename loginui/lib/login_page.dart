// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(children: [
              //Hello Again!//
              Text(
                'Hello Again!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20,),
              //email textfield
              TextField(),
              //password textfield

              //sign in button

              //not a member register now
            ]),
          ),
        ));
  }
}
