import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/utility/shadow.dart';
import 'package:swasthyapala_diabetes/utility/text_btn_spec.dart';

class MealWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color1),
          borderRadius: BorderRadius.circular(14),
          boxShadow: showInnerShadow(),
          color: color1),
      width: size.width * 0.9,
      child: SizedBox(
        height: size.height,
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
                      "\tBreakfast",
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
                            text: 'Mitho Daal Bhat ',
                            style: TextStyle(color: Colors.black87)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '9:00 am ',
                              style: TextStyle(
                                  fontSize: normal_text_size,
                                  color: normal_txt_color_black)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.alarm_off,
                        size: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                          onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
