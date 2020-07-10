import 'package:flutter/material.dart';

class RichTextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Flutter',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: 'News',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              letterSpacing: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
