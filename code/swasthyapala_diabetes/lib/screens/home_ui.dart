import 'package:flutter/material.dart';
import 'package:simple_coverflow/simple_coverflow.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import '../widgets/bg_widget.dart';
import '../widgets/meal_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '\t\tHello\n',
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                  TextSpan(
                      text: '\t\tMohan',
                      style: TextStyle(
                          fontSize: big_text_size,
                          fontWeight: FontWeight.bold,
                          color: color1)),
                ])),
              ),
              BGWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Image.asset('asset/images/nutritionist.png'),
                ),
                Container(
                  width: size.width * 0.3,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: AnimatedTextKit(
                    pause: Duration(seconds: 2),
                    animatedTexts: [
                      TypewriterAnimatedText(
                          "Let's get started with your breakfast",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontSize: medium_text_size,
                          ),
                          speed: Duration(milliseconds: 100)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CoverFlow(
              itemBuilder: widgetBuilder,
              dismissibleItems: false,
              dismissedCallback: disposeDismissed,
              currentItemChangedCallback: (int index) {
                print(index);
              },
            ),
          ),
          SizedBox(height: size.height * 0.1)
        ],
      ),
    );
  }
}

final List<Widget> data = [
  MealWidget(),
  MealWidget(),
  MealWidget(),
];
Widget widgetBuilder(BuildContext context, int index) {
  if (data.length == 0) {
    return new Container();
  } else {
    return data[index % data.length];
  }
}

disposeDismissed(int item, DismissDirection direction) {
  data.removeAt(item % data.length);
}
