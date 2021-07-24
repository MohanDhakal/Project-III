import 'package:flutter/cupertino.dart';
import 'package:swasthyapala_diabetes/enums-const/gender.dart';

class GenderBloc with ChangeNotifier {
  late Gender _gender;
  Gender get gender {
    return _gender;
  }

  set gender(g) {
    _gender = g;
    notifyListeners();
  }
}
