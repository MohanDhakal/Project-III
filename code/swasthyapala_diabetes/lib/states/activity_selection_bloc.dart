import 'package:flutter/cupertino.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';

class ActivityBloc with ChangeNotifier {
  Activity _activity = Activity.Se;
  Activity get activity {
    return _activity;
  }

  set activity(a) {
    _activity = a;
    notifyListeners();
  }
}
