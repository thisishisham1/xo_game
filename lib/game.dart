import 'package:flutter/material.dart';
import 'package:xo_game/xoButton.dart';
class Game extends StatefulWidget {
  @override
  State<Game> createState() => GameState();

}

class GameState extends State<Game> {
  List<String> Board=["","","",
      "","","","","",""
  ];
  int Player1=0;
  int Player2=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
    child: Container(
    height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.purple,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "player",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow),
                ),
              )),
          Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(100)),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "${Player1}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      VerticalDivider(thickness: 1, color: Colors.white54),
                      Container(
                        child: Text(
                          "${Player2}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "player",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              )),
        ],
      ),
    ),
    ),
        SizedBox(height: 70,),
        SizedBox(
          height: 400,
          width: 400,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black87,
                child: Column(
                  children:[
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          xobutton(game: Board[0],onClick: buttonClick,index: 0),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[1],onClick: buttonClick,index: 1),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[2],onClick: buttonClick,index: 2),
                        ],
                      ),
                    )),
                    const Divider(thickness: 1,color: Colors.purple,),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          xobutton(game: Board[3],onClick: buttonClick,index: 3),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[4],onClick: buttonClick,index: 4),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[5],onClick: buttonClick,index: 5,)
                        ],
                      ),
                    )),
                    const Divider(thickness: 1,color: Colors.purple,),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          xobutton(game: Board[6],onClick: buttonClick,index: 6),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[7],onClick: buttonClick,index: 7),
                          const VerticalDivider(thickness: 1,color: Colors.purple,),
                          xobutton(game: Board[8],onClick: buttonClick,index: 8)
                        ],
                      ),
                    )),
                  ],
                ),
              ),
        ),
      ],
    );
  }
  int counter=0;
  buttonClick(int index){
    if(Board[index].isNotEmpty) return;

    String game=counter%2==0?"O":"X";
    Board[index]=game;
    counter++;
    setState((){});
    if(chechWinner(game)){
      if(game=="X"){Colors.yellow;
        Player1++;
      }
      if(game=="O"){
        Colors.red;
        Player2++;
        print("player2:${Player2}");
      }
      rest();
    }
  }
  void rest(){
    Board=["","","","","","","","",""];
    counter=0;
    setState((){});
  }

  bool chechWinner(String game) {
    for(int i=0;i<9;i+=3) {
      if (Board[i] == game && Board[i + 1] == game && Board[i + 2] == game) {
        return true;
      }}
      for (int i = 0; i < 3; i++) {
        if (Board[i] == game && Board[i + 3] == game && Board[i + 6] == game) {
          return true;
        }
      }
      if (Board[0] == game && Board[4] == game && Board[8] == game) {
        return true;
      }
      if (Board[2] == game && Board[4] == game && Board[6] == game) {
        return true;
      }
      return false;

    }
  }
