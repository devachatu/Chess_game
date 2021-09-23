import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PWFOffline extends StatefulWidget {
  //const PWFOffline({Key? key}) : super(key: key);

  @override
  _PWFOfflineState createState() => _PWFOfflineState();
}

class _PWFOfflineState extends State<PWFOffline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChessBoard(
          whiteSideTowardsUser: true,
          size: 400.0,
          onMove: (move){
            print(move);
          },
          onCheckMate: (color) {
            print(color);
          },
          onDraw: () {
            print("DRAW!");
          },
          onCheck: (color){
            print(color);
          },
          boardType: BoardType.orange,
          enableUserMoves: true,
        ),
      ),
    );
  }
}



