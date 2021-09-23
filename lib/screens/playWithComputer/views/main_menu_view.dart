
import 'package:en_passant/screens/playWithComputer/model/app_model.dart';
import 'package:en_passant/screens/playWithComputer/views/components/main_menu_view/game_options.dart';
import 'package:en_passant/screens/playWithComputer/views/components/shared/bottom_padding.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/main_menu_view/main_menu_buttons.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
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
            return Container(
              decoration: BoxDecoration( gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.yellow[100]]
              )),
              padding: EdgeInsets.all(30),
              child: Column(
                children: [

                  SizedBox(height: 20),
                  GameOptions(appModel),
                  SizedBox(height: 10),
                  MainMenuButtons(appModel),
                  BottomPadding(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


