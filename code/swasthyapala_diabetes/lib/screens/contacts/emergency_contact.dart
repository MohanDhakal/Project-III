import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/status.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/services/db_storage/user_contact.dart';
import 'package:swasthyapala_diabetes/states/contacts.dart';
import 'package:swasthyapala_diabetes/utility/permission_services.dart';
import 'package:swasthyapala_diabetes/widgets/contact/emer_contact.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // List contactList;
  // Status state = Status.inactive;

  @override
  void initState() {
    super.initState();
    var ct = Provider.of<ContactBloc>(context, listen: false);
    getAllContacts().then((value) {
      ct.state = Status.processing;
      ct.clearAll();
      value.forEach((element) {
        ct.contactList.add(EmergencyContact().fromJson(element));
      });
      if (value.length > 0)
        ct.state = Status.active;
      else
        ct.state = Status.inactive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Emergency Contacts'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('Add new Contact'),
            ),
            IconButton(
                icon: Icon(Icons.add_call),
                onPressed: () async {
                  var permissionStatus = await getPermission();
                  switch (permissionStatus) {
                    case PermissionStatus.permanentlyDenied:
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                                title: Text('Permissions error'),
                                content: Text('Please enable contacts access '
                                    'permission in system settings'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('open system setting'),
                                    onPressed: () async {
                                      final settingStatus =
                                          await openAppSettings();
                                      print("setting status: $settingStatus");
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('cancel'),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                      break;
                    case PermissionStatus.granted:
                      final FullContact contact =
                          (await FlutterContactPicker.pickFullContact());
                      final userContact = EmergencyContact.name(
                        contact.name!.firstName,
                        contact.name!.middleName,
                        contact.name!.lastName,
                        contact.phones.elementAt(0).number,
                      );
                      // contact.photo
                      final ct =
                          Provider.of<ContactBloc>(context, listen: false);
                      ct.state = Status.processing;
                      ct.addContacts(userContact);
                      ct.state = Status.active;
                      break;

                    default:
                      break;
                  }
                }),
            Consumer<ContactBloc>(
              builder: (ctx, cntList, child) {
                return Container(
                    child: (cntList.state == Status.active)
                        ? ListView.builder(
                            itemCount: cntList.contactList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final arg = cntList.contactList.elementAt(index);

                              return EmergencyContactUI(ct: arg);
                            })
                        : (cntList.state == Status.processing)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Center(child: Text('No Contacts added')));
              },
            )
          ],
        ),
      ),
    );
  }
}
