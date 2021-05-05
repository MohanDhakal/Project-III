import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/services/storage/local_storage.dart';

class EmergencyContactUI extends StatelessWidget {
  final id, username, phone;

  EmergencyContactUI({this.id, this.username, this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset('asset/images/nutritionist.png'),
        title: Text("${username ?? 'unknown'}"),
        subtitle: Text("${phone ?? 'unkown'}"),
        trailing: InkWell(
            onTap: () {
              print(this.phone);
              final snackBar = SnackBar(
                content: Text('you sure want to delete?'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'confirm',
                  onPressed: _conformDeletion,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar,
              );
            },
            child: Icon(Icons.delete)),
      ),
    );
  }

  void _conformDeletion() {
    removeContact(this.phone);
  }
}
