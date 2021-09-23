import 'package:en_passant/screens/game_options.dart';
import 'package:flutter/material.dart';
import 'package:en_passant/constant.dart';

// as it's name implies it is the Login screen for the app
//TODO: to add login credentials of different platform
class LoginScreen extends StatelessWidget {

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
            Image.asset(imageAsset + "google_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "facebook_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "twitter_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "apple_login.png"),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/gameOptionScreen');
              },
              child: Text('Temporary Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
