import 'package:flutter/material.dart';

class LeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 60,
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
