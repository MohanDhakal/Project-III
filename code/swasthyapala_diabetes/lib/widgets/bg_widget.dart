import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';

class BGWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("150",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Text(
              "BG LEVEL",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        width: 150,
        height: 150,
        margin: EdgeInsets.fromLTRB(50, 50, 10, 0),
        decoration: BoxDecoration(
            color: color1,
            border: Border.all(width: 4, color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset.lerp(Offset(1, 1), Offset.zero, 0),
                blurRadius: 1.0,
                spreadRadius: 1.0,
              )
            ],
            borderRadius: BorderRadius.circular(75)),
      ),
    );
  }
}
