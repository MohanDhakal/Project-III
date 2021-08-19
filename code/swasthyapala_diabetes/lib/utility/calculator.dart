import 'package:swasthyapala_diabetes/enums-const/gender.dart';

dynamic calculateBMI(Gender g, int height, int weight, int age) {
  var BMR;
  if (g == Gender.Male) {
    BMR = 88.362 + 13.397 * weight + (4.799 * height) - (5.677 * age);
  } else
    BMR = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  return BMR;
}
