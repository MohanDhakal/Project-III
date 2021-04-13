import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';

//text btn color set
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return color2;
  }
  return color4;
}

double getElevation(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused
  };
  if (states.any(interactiveStates.contains)) {
    return 2.0;
  }
  return 0;
}
