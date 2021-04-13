import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';

List<BoxShadow> showInnerShadow() {
  return [
    BoxShadow(
      blurRadius: 4,
      offset: Offset(1.5, 1.5),
      color: meal_box,
    ),
    BoxShadow(
      blurRadius: 4,
      offset: -Offset(1.5, 1.5),
      color: meal_box,
    ),
  ];
}
