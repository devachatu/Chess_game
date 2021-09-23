import 'dart:async';

// import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/screens/playWithComputer/model/app_model.dart';
import 'package:en_passant/screens/playWithComputer/views/components/chess_view/chess_board_widget.dart';
import 'package:en_passant/screens/playWithComputer/views/components/chess_view/game_info_and_controls.dart';
import 'package:en_passant/screens/playWithComputer/views/components/chess_view/promotion_dialog.dart';
// import 'package:en_passant/views/components/chess_view/chess_board_widget.dart';
// import 'package:en_passant/views/components/chess_view/game_info_and_controls.dart';
// import 'package:en_passant/views/components/chess_view/promotion_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/chess_view/game_info_and_controls/game_status.dart';
import 'components/chess_view/game_info_and_controls/timer_widget.dart';
import 'components/chess_view/game_info_and_controls/timers.dart';
import 'components/shared/bottom_padding.dart';

class ChessView extends StatefulWidget {
  final AppModel appModel;

  ChessView(this.appModel);

  @override
  _ChessViewState createState() => _ChessViewState(appModel);
}

class _ChessViewState extends State<ChessView> {
  AppModel appModel;

  _ChessViewState(this.appModel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          centerTitle: true,
          title: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 30,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh,
                  color: Colors.black,
                  size: 30,
                )),
          ],
        ),
        body: Consumer<AppModel>(
          builder: (context, appModel, child) {
            if (appModel.promotionRequested) {
              appModel.promotionRequested = false;
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => _showPromotionDialog(appModel));
            }
            return WillPopScope(
              onWillPop: _willPopCallback,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
              gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.yellow[100]]
              )
            ),
                // padding: EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    TimerWidget(
                      timeLeft: appModel.player1TimeLeft,
                      color: Colors.red,
                    ),
                    SizedBox(height: 30),
                    // Spacer(),
                    ChessBoardWidget(appModel),
                    SizedBox(height: 30),

                    // Spacer(),
                    // GameStatus(),
                    // Spacer(),
                    // Timers(appModel),
                    TimerWidget(
                      timeLeft: appModel.player2TimeLeft,
                      color: Colors.blue,
                    ),
                    Spacer(),
                    hintButton(),
                    SizedBox(height: 30),

                    // GameInfoAndControls(appModel),
                    // BottomPadding(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget hintButton() {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'Hint',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  void _showPromotionDialog(AppModel appModel) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return PromotionDialog(appModel);
      },
    );
  }

  Future<bool> _willPopCallback() async {
    if (appModel != null) {
      appModel.exitChessView();
    }
    return true;
  }
}
