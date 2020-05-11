import 'package:flutter/material.dart';

Widget buildTrailing() {
  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
      ),
      RotatedBox(
        quarterTurns: -1,
        child: Text('Trailing'),
      ),
    ],
  );
}
