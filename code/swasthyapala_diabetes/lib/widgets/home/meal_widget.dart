import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/screens/meal_explore.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/meal_today.dart';
import 'package:swasthyapala_diabetes/utility/shadow.dart';
import 'package:swasthyapala_diabetes/utility/text_btn_spec.dart';

class MealWidget extends StatefulWidget {
  final mealName, time, mealType;
  final meal;

  MealWidget(
      {required this.mealName, required this.time, this.meal, this.mealType});

  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  bool eaten = false;

  @override
  void initState() {
    super.initState();
    adjustWidgetStatus(widget.mealType);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color1),
          borderRadius: BorderRadius.circular(14),
          boxShadow: showInnerShadow(),
          color: !eaten ? color1 : color6),
      width: size.width * 0.8,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "asset/images/boul.png",
                      width: 60,
                      height: 60,
                    ),
                    Container(
                      width: size.width * 0.10,
                      height: 2,
                      color: Colors.black,
                    ),
                    Text(
                      "\t${widget.mealType}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: widget.mealName,
                            style: TextStyle(color: Colors.black87)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: widget.time,
                              style: TextStyle(
                                  fontSize: normal_text_size,
                                  color: normal_txt_color_black)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                          onPressed: () {
                            // getMeals(1);
                            print(widget.meal['ingredients']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MealDetail(meal: widget.meal)));
                          },
                          child: Text('View Detail',
                              style: TextStyle(fontSize: normal_text_size)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith(getColor),
                            foregroundColor: MaterialStateProperty.all(
                                normal_txt_color_black),
                            elevation:
                                MaterialStateProperty.resolveWith(getElevation),
                          )),
                    )
                  ],
                )
              ],
            ),
            !eaten
                ? MaterialButton(
                    onPressed: () {
                      setWidgetStatus(widget.mealType);
                    },
                    child: Text("Mark as Eaten"),
                    color: color9,
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  adjustWidgetStatus(String key) async {
    var status;

    switch (key) {
      case 'Lunch':
        status = await getmealEaten('Lu');
        if (status) {
          setState(() {
            eaten = !eaten;
          });
        }
        break;
      case 'Dinner':
        status = await getmealEaten('Di');
        if (status) {
          setState(() {
            eaten = !eaten;
          });
        }

        break;
      case 'Snacks':
        status = await getmealEaten('Sn');
        if (status) {
          setState(() {
            eaten = !eaten;
          });
        }

        break;
      case 'Breakfast':
        status = await getmealEaten('Br');
        if (status) {
          setState(() {
            eaten = !eaten;
          });
        }

        break;
      default:
        status = await getmealEaten('Br');
        if (status) {
          setState(() {
            eaten = !eaten;
          });
        }
    }
  }

  setWidgetStatus(String key) {
    switch (key) {
      case 'Lunch':
        setMealEaten('Lu');
        setState(() {
          eaten = !eaten;
        });
        break;
      case 'Dinner':
        setMealEaten('Di');
        setState(() {
          eaten = !eaten;
        });

        break;
      case 'Snacks':
        setMealEaten('Sn');
        setState(() {
          eaten = !eaten;
        });

        break;
      case 'Breakfast':
        setMealEaten('Br');
        setState(() {
          eaten = !eaten;
        });

        break;
      default:
        setMealEaten('Sn');
    }
  }
}
