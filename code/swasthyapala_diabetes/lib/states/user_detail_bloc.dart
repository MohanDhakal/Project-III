import 'package:flutter/foundation.dart';

class UserDetailBloc with ChangeNotifier {
  late double _weight;
  late double _height;
  late int _age;

  double get weight {
    return _weight;
  }

  double get height {
    return _height;
  }

  int get age {
    return _age;
  }

  set weight(w) {
    _weight = w;
  }

  set height(h) {
    _height = h;
    notifyListeners();
  }

  set age(a) {
    _age = a;
    notifyListeners();
  }
}
