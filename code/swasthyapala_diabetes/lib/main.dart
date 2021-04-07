import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeUI(),
    );
  }
}

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '\t\tHello\n',
                      style: TextStyle(fontSize: 24, color: Colors.black45)),
                  TextSpan(
                      text: '\t\tMohan',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45)),
                ])),
              ),
              BGWidget(),
            ],
          ),
          SizedBox(
            height: size.height * 0.5,
          ),
          MealWidget(),
        ],
      ),
    );
  }
}

class MealWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 2,
            width: size.width * 0.10,
            color: Colors.red,
            margin: EdgeInsets.all(2),
          ),
          Text(
            "Breakfast",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '\tMeal Name : ', style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: 'Daal Bhat ', style: TextStyle(color: Colors.black45)),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(text: '\tTime : ', style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: '9:00 am ', style: TextStyle(color: Colors.black45)),
            ])),
          )
        ],
      ),
    );
  }
}

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
                    color: Colors.red)),
            Text(
              "BG LEVEL",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        width: 150,
        height: 150,
        margin: EdgeInsets.fromLTRB(50, 50, 10, 0),
        decoration: BoxDecoration(
            color: color3,
            border: Border.all(width: 1, color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset.lerp(Offset(-1, 1), Offset.zero, 0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              )
            ],
            borderRadius: BorderRadius.circular(75)),
      ),
    );
  }
}
