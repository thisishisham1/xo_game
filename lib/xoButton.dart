import 'package:flutter/material.dart';
class xobutton extends StatelessWidget {
  String game;
  Function onClick;
  int index;
  xobutton({required this.game,required  this.onClick,required this.index,});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      alignment: Alignment.center,
        child: ElevatedButton(
          child:Text("$game",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
            color:game=="O"?Colors.red: Colors.yellow,
        ),),
          onPressed:() {
            onClick(index);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black87,
            minimumSize: Size(150, 150)
          ),

        ),
      ),
    );
  }
}
