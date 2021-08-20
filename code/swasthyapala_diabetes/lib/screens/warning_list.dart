import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/models/warning.dart';
import 'package:swasthyapala_diabetes/services/db_storage/messages.dart';
import 'package:swasthyapala_diabetes/widgets/warning.dart';

class WarningList extends StatefulWidget {
  @override
  _WarningListState createState() => _WarningListState();
}

class _WarningListState extends State<WarningList> {
  var notifications = [];

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Notifications: $notifications");
    return Material(
      child: Container(
        child: (notifications.length < 1)
            ? Container(
                child: Center(child: Text("No messages yet")),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Warning(notifications.elementAt(index).title,
                      notifications.elementAt(index).content);
                },
                itemCount: notifications.length,
              ),
      ),
    );
  }

  getNotifications() async {
    var notificationList = await getAllNotificationMessages();
    var wList = [];
    notificationList.forEach((element) {
      wList.add(WarningMessage().fromJson(element));
    });
    setState(() {
      notifications = wList;
    });
  }
}
