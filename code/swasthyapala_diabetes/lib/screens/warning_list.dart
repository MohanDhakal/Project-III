import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/services/db_storage/messages.dart';
import 'package:swasthyapala_diabetes/widgets/warning.dart';

class WarningList extends StatefulWidget {
  @override
  _WarningListState createState() => _WarningListState();
}

class _WarningListState extends State<WarningList> {
  var notifications;
  final items = List<Widget>.generate(
      100, (i) => Warning("title:$i", "this is content$i"));

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
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return items[index];
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  getNotifications() async {
    var notificationList = await getAllNotificationMessages();
    setState(() {
      notifications = notificationList;
    });
  }
}
