import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swasthyapala_diabetes/screens/user_form.dart';

import 'screens/home_ui.dart';

void main() {
  runApp(MyApp());
}

// AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarBrightness: Brightness.dark,
//           systemNavigationBarColor: null),

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: UserForm(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
