//sends sms to user at some point of time
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/bg_level.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/sms_pref.dart';
import 'package:telephony/telephony.dart';

Telephony telephony = Telephony.instance;

bool? permissionGranted;

Future<bool?> smsPermissionGranted() async {
  permissionGranted = await telephony.requestSmsPermissions;
  return permissionGranted;
}

final SmsSendStatusListener listener = (SendStatus status) {
  print("SMS Status: $status");
};

void sendSmsToUser() async {
  await telephony.sendSms(
      to: "9862790724",
      message: "This is swasthyapala test, if received please inform!",
      statusListener: listener);
}

Future<bool> sendMessageInBackground(task, inputData) async {
  // print(task);
  final bg = await getCurrentBgValue();
  // print("Your Current BG Value: $bg");
  final telephony = Telephony.instance;
  if (bg > 20) {
    try {
      print('sms can be sent');
      // await telephony.sendSms(
      //     to: "9862790724",
      //     message: "This is swasthyapala background message test",
      //     statusListener: listener);
    } catch (e) {
      print('Error sending sms to the specified phone number');
    }
  } else {
    print('no warning yet');
  }
  return Future.value(true);
}
