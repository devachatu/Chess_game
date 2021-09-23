import 'package:flutter/material.dart';
import 'package:en_passant/constant.dart';

class PlayWithFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Icon(Icons.arrow_back, size: 40,),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/pwfOffline');
            },
            child: Center(
              child: Image.asset(imageAsset + "pl.png"),
            ),
          ),
          SizedBox(height: 20),
          Center(child: Image.asset(imageAsset+"po.png")),
        ],
      ),
    );
  }
}
