import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/tag-value.dart';

class IngredientInfo extends StatelessWidget {
  final name;
  final qty;
  final unit;
  final TagValue tv;
  IngredientInfo(
      {@required this.name, @required this.qty, this.unit, required this.tv});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name,
                    style: TextStyle(
                        color: normal_txt_color_black,
                        fontWeight: (tv == TagValue.tag)
                            ? FontWeight.bold
                            : FontWeight.normal)),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: qty,
                        style: TextStyle(
                            color: normal_txt_color_black,
                            fontWeight: (tv == TagValue.tag)
                                ? FontWeight.bold
                                : FontWeight.normal)),
                    TextSpan(
                        text: '\t\t($unit)',
                        style: TextStyle(
                            color: (tv == TagValue.tag
                                ? color1
                                : normal_txt_color_black))),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
