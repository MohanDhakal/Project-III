import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/screens/meal_explore.dart';

Map<String, double> dataMap = {
  "Protein": 5,
  "Carbohydrate": 3,
  "Fat": 2,
};

class NutritonInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: [
          Positioned(
              top: size.height * 0.15,
              child: TitleHorizontalLine(titleText: "Breakfast")),
          PieChart(dataMap: dataMap)
        ],
      ),
    );
  }
}
