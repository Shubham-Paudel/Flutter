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
        Center(child: Image.network("https://scontent.fktm3-1.fna.fbcdn.net/v/t1.6435-9/84358946_2594088337488434_3235916527895052288_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=_wyg1RcupK0AX_PC6v1&_nc_oc=AQnkM-KWuKL9nI9eW9yKnSvvfGuAe2dW0oN3fNLiDzUsWY_WOQoCLPy6FWtksHQgDOs&_nc_ht=scontent.fktm3-1.fna&oh=00_AfBc-MJ2aGlSNPfWkLUFYJ72JdcUo1rSLGrxbTLOysg53w&oe=6569D099", height: 400, width: 600)),
        const SizedBox(height: 10),
        const Text('Name: Shubham Raj Paudel', style: TextStyle(fontSize: 24,color: Colors.green, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text("Address:Kalanki, Nepal",style: TextStyle(fontSize: 19)),
        const SizedBox(height: 5,),
        const Text('Email: shubhampaudel7@gmail.com',style: TextStyle(fontSize: 19)),
        const SizedBox(height: 90),
        const Text('Developed by: Shubham Raj Paudel',style:TextStyle(fontWeight: FontWeight.bold)),
      ],),
      )
    ,));
}
