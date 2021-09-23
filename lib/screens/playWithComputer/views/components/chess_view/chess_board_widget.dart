import 'package:en_passant/screens/playWithComputer/model/app_model.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChessBoardWidget extends StatelessWidget {
  final AppModel appModel;

  ChessBoardWidget(this.appModel);

  @override
  Widget build(BuildContext context) {
    return Container(


      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color:Color(0xff8c5415)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: GameWidget(game: appModel.game),
                  width: MediaQuery.of(context).size.width - 68,
                  height: MediaQuery.of(context).size.width - 68,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
