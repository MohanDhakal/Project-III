import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/tag-value.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/ingredient.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/nutrition_chart.dart';

class IngredientDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: normal_txt_color_black,
        ),
        title: Text(
          'Ingredients',
          style: TextStyle(color: normal_txt_color_black),
        ),
        backgroundColor: color1,
      ),
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: ListView(
          children: [
            Container(
              height: 1,
              width: size.width,
              color: Colors.black38,
              margin: EdgeInsets.all(5.0),
            ),
            IngredientInfo(
              name: 'NAME',
              qty: 'QTY',
              tv: TagValue.tag,
              unit: 'Unit',
            ),
            Container(
              height: 1,
              width: size.width,
              color: Colors.black38,
              margin: EdgeInsets.all(5.0),
            ),
            IngredientInfo(
              name: 'Rice',
              qty: '100',
              tv: TagValue.value,
              unit: 'GM',
            ),
            IngredientInfo(
              name: 'Water',
              qty: '100',
              tv: TagValue.value,
              unit: 'ML',
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: normal_txt_color_black,
        ),
        title: Text(
          'Ingredients',
          style: TextStyle(color: normal_txt_color_black),
        ),
        backgroundColor: color1,
      ),
      body: NutritonInfo(),
    );
  }
}
