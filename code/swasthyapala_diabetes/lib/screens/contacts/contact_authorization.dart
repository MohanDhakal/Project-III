import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/widgets/contact/authorization_btn.dart';

class ContactAuthorization extends StatelessWidget {
  final EmergencyContact emc;
  ContactAuthorization(this.emc);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Authorization'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 40,
            ),
            Text(
              "${emc.firstName} ${emc.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              "${emc.phoneNumber}",
              style: TextStyle(fontSize: 26),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.black,
            ),
            Text(
              'Select what you want to do with the above contact',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContactAuthorizationBtn('Send Meal Info', emc.phoneNumber),
                ContactAuthorizationBtn('Send Emergency Info', emc.phoneNumber),
              ],
            ),
            Text(
              'double tap to select',
              style: TextStyle(color: color6),
            )
          ],
        ),
      ),
    );
  }
}
