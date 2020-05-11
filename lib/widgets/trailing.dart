import 'package:flutter/material.dart';

// trailing widget (Flutter Logo and a Text(Flutter)
// Uses a SizedBox in before the two widgets to give vertical space between the widgets and the NavigationRailDestinations
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
