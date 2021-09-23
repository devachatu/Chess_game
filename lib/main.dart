
import 'package:en_passant/screens/playWithComputer/logic/shared_functions.dart';
import 'package:en_passant/screens/playWithComputer/model/app_model.dart';
import 'package:en_passant/screens/playWithComputer/views/main_menu_view.dart';

import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:en_passant/screens/board/chessBoard.dart';
import 'package:en_passant/screens/chess_pwf_offline.dart';
import 'package:en_passant/screens/game_options.dart';
import 'package:en_passant/screens/login_screen.dart';
  import 'package:en_passant/screens/play_with_friends.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: EnPassantApp(),
    ),
  );
  _loadFlameAssets();
}

void _loadFlameAssets() async {
  List<String> pieceImages = [];
  for (var theme in PIECE_THEMES) {
    for (var color in ['black', 'white']) {
      for (var piece in ['king', 'queen', 'rook', 'bishop', 'knight', 'pawn']) {
        pieceImages
            .add('pieces/${formatPieceTheme(theme)}/${piece}_$color.png');
      }
    }
  }
  await Flame.images.loadAll(pieceImages);
}

class EnPassantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoApp(
      routes: {
        '/' : (context) => LoginScreen(),
        '/gameOptionScreen': (context) => GameOptionScreen(),
        '/playWithFriends': (context) => PlayWithFriends(),
        '/playWithComputer': (context) => MainMenuView(),
        '/chessBoard': (context) => ChessBoard(),
        '/pwfOffline': (context) => PWFOffline(),
      } ,
      title: 'En Passant',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Jura', fontSize: 16),
          pickerTextStyle: TextStyle(fontFamily: 'Jura'),
        ),
      ),

    );
  }
}
