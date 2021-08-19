import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/paths.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '$assetImage/no-wifi.png',
            height: 100,
            width: 100,
          ),
          SizedBox(
              width: 200,
              child: Text("please restore your internet and try again!!!",
                  textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
