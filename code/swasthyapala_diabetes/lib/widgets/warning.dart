import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  final title, content;

  Warning(this.title, this.content);

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
          title: Text(this.title ?? 'this is title'),
          leading: Icon(Icons.notifications_active),
          subtitle:Text(this.content ?? 'this is Content'),
          trailing: Text(
            "Date: ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
