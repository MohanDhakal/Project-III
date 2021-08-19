import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/screens/forms/survey_form.dart';
import 'package:swasthyapala_diabetes/screens/redirections/internet.dart';
import 'package:swasthyapala_diabetes/screens/test/api_test.dart';
import 'package:swasthyapala_diabetes/screens/test/push_notification_test.dart';
import 'package:swasthyapala_diabetes/services/sms/sms_service.dart';
import 'package:swasthyapala_diabetes/states/contacts_bloc.dart';
import 'package:workmanager/workmanager.dart';
import 'screens/home_ui.dart';

void callbackDispatcher() {
  Workmanager().executeTask(sendMessageInBackground);
}

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Workmanager().initialize(
  //   callbackDispatcher, // The top level function, aka callbackDispatcher
  //   isInDebugMode: false,
  //   // If enabled it will post, a notification whenever the task is running. Handy for debugging tasks
  // );
  // Workmanager()
  //     .registerOneOffTask("1", "smsTask", initialDelay: Duration(seconds: 20));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      child: OverlaySupport(
        child: MaterialApp(
          title: 'Swasthyapala',
          // home: NotificationTest(),
          home: ChangeNotifierProvider(
              create: (_) => ContactBloc(), child: HomeUI()),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
