import 'package:en_passant/screens/playWithComputer/views/components/shared/text_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final Duration timeLeft;
  final Color color;

  TimerWidget({@required this.timeLeft, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange[800]),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/images/playerProfile.jpg',
                // width: 300,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: color),
                child: Center(
                    child: Text(
                      _durationToString(timeLeft),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            ),
          ],
        ),
      ),
    );

  }

  String _durationToString(Duration duration) {
    if (duration.inHours > 0) {
      String hours = duration.inHours.toString();
      String minutes =
          duration.inMinutes.remainder(60).toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$hours:$minutes:$seconds';
    } else if (duration.inMinutes > 0) {
      String minutes = duration.inMinutes.toString();
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    } else {
      String seconds = duration.inSeconds.toString();
      return '$seconds';
    }
  }
}
