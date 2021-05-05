import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swasthyapala_diabetes/chart-demo.dart';
import 'package:swasthyapala_diabetes/screens/detail_screen.dart';
import 'package:swasthyapala_diabetes/screens/emergency_contact.dart';
import 'package:swasthyapala_diabetes/screens/forms/survey_form.dart';
import 'package:swasthyapala_diabetes/screens/forms/user_form.dart';
import 'package:swasthyapala_diabetes/screens/meal_explore.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/ingredient.dart';
import 'package:swasthyapala_diabetes/widgets/detail-meal/nutrition_chart.dart';
import 'package:swasthyapala_diabetes/widgets/forms/weight_form.dart';

import 'screens/home_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Contacts(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
