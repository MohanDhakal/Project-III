import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:swasthyapala_diabetes/enums-const/meal.dart';
import 'package:swasthyapala_diabetes/utility/setup_timezone.dart';

FlutterLocalNotificationsPlugin? fLNP;

displayNofitication(message) async {
  var android = new AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high, importance: Importance.max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android: android, iOS: iOS);
  //payload will be passed back on notification tapped.
  fLNP!.show(message.id, message.title, message.body, platform,
      payload: message.payload);
}

initializationiSetup() {
  fLNP = FlutterLocalNotificationsPlugin();
  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var iOS = new IOSInitializationSettings();
  final initializationSettings =
      InitializationSettings(android: android, iOS: iOS);
  fLNP!.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

Future onSelectNotification(String? payload) async {
  print("payload : $payload");
}

Future<void> scheduleNotificationAtHrMin(
    {required int hour, required int min}) async {
  await fLNP!.zonedSchedule(
    0,
    'Scheude notification title',
    'daily scheduled notification body',
    nextInstanceOfHrMin(hour, min),
    const NotificationDetails(
      android: AndroidNotificationDetails(' id',
          'daily notification swasthyapala', 'daily notification description'),
    ),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}

Future<void> scheduleMealFor(MealType meal) async {
  switch (meal) {
    case MealType.breakfast:
      await scheduleNotificationAtHrMin(hour: 7, min: 0);
      break;
    case MealType.lunch:
     await scheduleNotificationAtHrMin(hour: 10, min: 30);
      break;
    case MealType.dinner:
      await scheduleNotificationAtHrMin(hour: 19, min: 30);
      break;
    case MealType.snacks:
      await scheduleNotificationAtHrMin(hour: 15, min: 00);
      break;
  }
}
