import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:swasthyapala_diabetes/enums-const/status.dart';
import 'package:swasthyapala_diabetes/models/contact_pref.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/services/db_storage/contact_preference.dart';
import 'package:swasthyapala_diabetes/services/db_storage/user_contact.dart';

class ContactBloc with ChangeNotifier {
  //updates the list of contacts
  List<EmergencyContact> contactList = [];
  var _state = Status.inactive;

  set state(s) {
    _state = s;
    notifyListeners();
  }

  Status get state {
    return _state;
  }

  void addContacts(EmergencyContact contact) {
    contactList.add(contact);
    addEmergencyContact(contact);
    //dummy preferences value for placement initially
    final cpf = ContactPref();
    cpf.emerPref = 0;
    cpf.mealPref = 0;
    cpf.phoneNumber = contact.phoneNumber;
    print(cpf.phoneNumber);
    addContactPreference(cpf);
    notifyListeners();
  }

  void removeContacts(EmergencyContact contact) {
    contactList.remove(contact);
    removeContact(contact.phoneNumber);
    removePreference(contact.phoneNumber);
    notifyListeners();
  }

  void clearAll() {
    contactList.clear();
    notifyListeners();
  }
}
