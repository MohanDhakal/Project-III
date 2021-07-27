import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';
import 'package:swasthyapala_diabetes/utility/enum_to_string.dart';

class UserDetail {
  double _weight = 62.5;
  double _height = 5.6;
  int _age = 36;
  String _sex = getTextFromEnum(Gender, Gender.Male);
  String _activity = getTextFromEnum(Activity, Activity.Ha);

  String allergy = 'GLUTEN';

  Map<String, dynamic> toMap() {
    return {
      'weight': this.weight,
      'height': this.height,
      'allergy': this.allergy,
      'gender': this.sex,
      'age': this._age,
      'activity': this._activity
    };
  }

  double get weight {
    return _weight;
  }

  double get height {
    return _height;
  }

  int get age {
    return _age;
  }

  String get sex {
    return _sex;
  }

  String get activity {
    return _activity;
  }

  set weight(w) {
    _weight = w;
  }

  set height(h) {
    _height = h;
  }

  set age(a) {
    _age = a;
  }

  set sex(s) {
    _sex = s;
  }

  set activity(a) {
    _activity = a;
  }
}
