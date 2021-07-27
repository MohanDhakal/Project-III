import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swasthyapala_diabetes/screens/meal_explore.dart';

class NutritonInfo extends StatefulWidget {
  final nutrition;
  NutritonInfo(this.nutrition);

  @override
  _NutritonInfoState createState() => _NutritonInfoState();
}

class _NutritonInfoState extends State<NutritonInfo> {
  Map<String, double> dataMap = {
    "Protein": 5,
    "Carbohydrate": 3,
    "Fat": 2,
  };
  @override
  void initState() {
    super.initState();
    print(widget.nutrition['protein']);
    Map<String, double> newMap = {
      "Protein": widget.nutrition['protein'].toDouble(),
      "carbs": widget.nutrition['carbs'].toDouble(),
      "fat": widget.nutrition['fat'].toDouble(),
    };

    setState(() {
      dataMap = newMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        child: Stack(
          children: [
            Positioned(
                top: size.height * 0.15,
                child: TitleHorizontalLine(titleText: "Breakfast")),
            PieChart(
              dataMap: dataMap,
              centerText: 'Nutrition',
            )
          ],
        ),
      ),
    );
  }
}
