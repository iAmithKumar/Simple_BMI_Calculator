import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  BottomBar({@required this.onTap, @required this.bottomTitle});

  final String bottomTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        child: Center(
          child: Text(
            bottomTitle,
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 90.0,
      ),
    );
  }
}
