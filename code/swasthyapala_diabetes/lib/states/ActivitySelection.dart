import 'package:flutter/cupertino.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';

class ActivityBloc with ChangeNotifier {
  late Activity _activity;
  Activity get activity {
    return _activity;
  }

  set activity(a) {
    _activity = a;
    notifyListeners();
  }
}
