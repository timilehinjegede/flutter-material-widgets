import 'package:flutter/material.dart';

class TrailingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text('More'),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }
}
