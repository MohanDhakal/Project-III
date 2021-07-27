import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/tag-value.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/ingredient.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/nutrition_chart.dart';

class IngredientDetail extends StatelessWidget {
  final ingredients;
  IngredientDetail(this.ingredients);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: normal_txt_color_black,
          ),
        ),
        title: Text(
          'Ingredients',
          style: TextStyle(color: normal_txt_color_black),
        ),
        backgroundColor: color1,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: ingredients.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 1,
                          width: size.width,
                          color: Colors.black38,
                          margin: EdgeInsets.all(5.0),
                        ),
                        IngredientInfo(
                          name: ingredients[index]['name'],
                          qty: ingredients[index]['qty'],
                        ),
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}

class NutritionDetail extends StatelessWidget {
  final mealNutrition;
  NutritionDetail(this.mealNutrition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: normal_txt_color_black,
          ),
        ),
        title: Text(
          'Nutrition',
          style: TextStyle(color: normal_txt_color_black),
        ),
        backgroundColor: color1,
      ),
      body: NutritonInfo(mealNutrition),
    );
  }
}
