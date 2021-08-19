import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void addMeal(String meal) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('meal', meal);
  prefs.setInt('day', DateTime.now().day);

  //to check if the meal has been eaten
  prefs.setBool('Br', false);
  prefs.setBool('Lu', false);
  prefs.setBool('Di', false);
  prefs.setBool('Sn', false);
}

Future<String> getMeal() async {
  final prefs = await SharedPreferences.getInstance();
  String meal = prefs.getString('meal') ?? '[]';

  //if accidentally empty list string is stored as a response, set status to false
  if (meal == "[]") {
    meal = '[{"status":false}]';
  }
  //if the meal was of the previous day set status to false again
  if (prefs.getInt('day') != DateTime.now().day) {
    meal = '[{"status":false}]';
  }
  return meal;
}

Future<bool> getmealEaten(key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

void setMealEaten(key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, true);
}

Future<Map<String, dynamic>> getConsumedNutrition() async {
  final prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> totalNutrition = {
    'carbs': 0.0,
    'protein': 0.0,
    'fat': 0.0,
    'calorie': 0.0
  };
  String meal = prefs.getString('meal') ?? 'NA';
  var jsonr = json.decode(meal);

  if (prefs.getBool('Br') == true) {
    if (meal != 'NA') {
      jsonr.forEach((element) {
        List<dynamic> fts=jsonDecode(element['type']);
        print(fts);
        if (fts.contains('BREAKFAST')) {

          totalNutrition['carbs'] += element['carbs'];
          totalNutrition['fat'] += element['fat'];
          totalNutrition['protein'] += element['protein'];
          totalNutrition['calorie'] += element['calorie'];
        }
      });
    }
  }
  if (prefs.getBool('Lu') == true) {
    if (meal != 'NA') {
      jsonr.forEach((element) {
        List<dynamic> fts=jsonDecode(element['type']);
        if (fts.contains('LUNCH')) {
          totalNutrition['carbs'] += element['carbs'];
          totalNutrition['fat'] += element['fat'];
          totalNutrition['protein'] += element['protein'];
          totalNutrition['calorie'] += element['calorie'];
        }
      });
    }
  }
  if (prefs.getBool('Di') == true) {
    if (meal != 'NA') {
      jsonr.forEach((element) {
        List<dynamic> fts=jsonDecode(element['type']);
        if (fts.contains('DINNER')) {
          totalNutrition['carbs'] += element['carbs'];
          totalNutrition['fat'] += element['fat'];
          totalNutrition['protein'] += element['protein'];
          totalNutrition['calorie'] += element['calorie'];
        }
      });
    }
  }
  return totalNutrition;
}
