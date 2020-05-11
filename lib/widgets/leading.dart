import 'package:flutter/material.dart';

// leading widget (Flutter Logo and a Text(Flutter)
// Uses a SizedBox in between the two widgets to give vertical space to the widgets
class LeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 55,
        ),
        SizedBox(
          height: 20,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            'Flutter',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
