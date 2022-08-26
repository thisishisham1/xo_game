import 'package:flutter/material.dart';
import 'game.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body:Center(
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0.8784313725490196),
          child: Column(
            children: [
              SizedBox(height: 75),
              Game(),
            ],
          ),
        ),
      ) ,
    ),
  ));
}