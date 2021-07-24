import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';

String getTextFromEnum(title, value) {
  if (title == Gender) {
    switch (value) {
      case Gender.Male:
        return 'Male';
      case Gender.Female:
        return 'Female';
      default:
        return 'Others';
    }
  } else if (title == Activity) {
    switch (value) {
      case Activity.Ha:
        return 'Active';
      case Activity.Mo:
        return 'Moderate';
      default:
        return 'Sedentary';
    }
  } else
    return 'N/A';
}
