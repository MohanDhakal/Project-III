import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swasthyapala_diabetes/enums-const/status.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/services/storage/local_storage.dart';
import 'package:swasthyapala_diabetes/utility/permission_services.dart';
import 'package:swasthyapala_diabetes/widgets/contact/emer_contact.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List contactList;
  Status state = Status.inactive;

  @override
  void initState() {
    super.initState();

    getAllContacts().then((value) {
      setState(() {
        contactList = value;
        state = Status.active;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Emergency Contacts'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text('Add new Contact'),
            ),
          ),
          IconButton(
              icon: Icon(Icons.add_call),
              onPressed: () async {
                var permissionStatus = await getPermission();
                switch (permissionStatus) {
                  case PermissionStatus.permanentlyDenied:
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
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
                        contact.name.firstName,
                        contact.name.middleName,
                        contact.name.lastName,
                        contact.phones.elementAt(0).number,
                        contact.photo.bytes);
                    addEmergencyContact(userContact);
                    break;
                }
              }),
          (state == Status.active)
              ? ListView.builder(
                  itemCount: contactList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List<EmergencyContact> emcList = [];
                    contactList.forEach((element) {
                      emcList.add(EmergencyContact().fromJson(element));
                    });
                    return EmergencyContactUI(
                      username: "${emcList[index].firstName}"
                          "${emcList[index].middleName ?? ''}"
                          "${emcList[index].lastName} ",
                      phone: '${emcList[index].phoneNumber}',
                    );
                  })
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
    );
  }
}
