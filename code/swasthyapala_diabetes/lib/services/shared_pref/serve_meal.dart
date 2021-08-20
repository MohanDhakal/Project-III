import 'dart:convert';

import 'package:swasthyapala_diabetes/services/http/meals.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/meal_today.dart';

//gets the meals and store in the sharedpreferences
Future<List> getMealToday(id) async {
  String meals = await getMeal();
  List ml = json.decode(meals);
  if (ml.elementAt(0)['status'] == false) {
    await addTodaysMeal(id);
    meals = await getMeal();
    ml = json.decode(meals);
    print(ml);
  }
  return ml;
}

//retrieves meal from the server and adds it to the sharedprefereces
Future addTodaysMeal(int id) async {
  //get meals from the server
  String meal = await getMeals1(id);
  var ml = json.decode(meal);
  if (ml.length >= 2) {
    //add this meal to the shared pref along with today's dates day
    addMeal(meal);
  }
}
