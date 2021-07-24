class UserDetail {
  late double _weight;
  late double _height;
  late int _age;
  late String _sex;
  late String _activity;

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
