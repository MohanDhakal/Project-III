import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/screens/contacts/contact_authorization.dart';
import 'package:swasthyapala_diabetes/states/contacts.dart';

class EmergencyContactUI extends StatelessWidget {
  final EmergencyContact ct;
  EmergencyContactUI({required this.ct});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ContactAuthorization(ct)));
        },
        child: Container(
          child: ListTile(
            leading: Icon(Icons.person, size: 24),
            title: Text(ct.firstName!),
            subtitle: Text(ct.phoneNumber!),
            trailing: InkWell(
                onTap: () {
                  // print(ct.phoneNumber);
                  final snackBar = SnackBar(
                    content: Text('you sure want to delete?'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'confirm',
                      onPressed: () {
                        Provider.of<ContactBloc>(context, listen: false)
                            .removeContacts(ct);
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar,
                  );
                },
                child: Icon(Icons.delete)),
          ),
        ),
      ),
    );
  }
}
