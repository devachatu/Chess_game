import 'package:flutter/material.dart';
// import 'package:chess_app/constant.dart';

import '../constant.dart';

// as it's name implies it is the Login screen for the app
//TODO: to add login credentials of different platform
class GameOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenSize().height(context),
        width: ScreenSize().width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize().height(context) * 0.14,
            ),
            Image.asset(imageAsset + "LOGO.png"),
            // add gesture detection to all the google
            // facebook, twitter and apple buttons,
            SizedBox(
              height: ScreenSize().height(context) * 0.08,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/playWithFriends');
              },
              child: Image.asset(imageAsset + "pwf.png"),
            ),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/playWithComputer');
              },
              child: Image.asset(imageAsset + "pwc.png"),
            ),

            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "t.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "dc.png"),
          ],
        ),
      ),
    );
  }
}
