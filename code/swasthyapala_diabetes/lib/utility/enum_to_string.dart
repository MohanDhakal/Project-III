import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';

String getTextFromEnum(title, value) {
  if (title == Gender) {
    switch (value) {
      case Gender.Male:
        return 'MALE';
      case Gender.Female:
        return 'FEMALE';
      default:
        return 'OTHERS';
    }
  } else if (title == Activity) {
    switch (value) {
      case Activity.Ha:
        return 'ACTIVE';
      case Activity.Mo:
        return 'MODERATE';
      default:
        return 'SEDENTARY';
    }
  } else
    return 'N/A';
}
