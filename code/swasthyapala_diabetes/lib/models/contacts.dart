import 'dart:typed_data';

class EmergencyContact {
  String firstName;
  String middleName;
  String lastName;
  String phoneNumber;
  Uint8List photo;

  EmergencyContact.name(this.firstName, this.middleName, this.lastName,
      this.phoneNumber, this.photo);
  EmergencyContact();

  //  Convert a Contact into a Map. The keys must correspond to the names of the
  // columns in the database.

  Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'middleName': this.middleName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'photo': this.photo
    };
  }

  EmergencyContact fromJson(Map<String, dynamic> elem) {
    this.firstName = elem['firstName'];
    this.middleName = elem['middleName'];
    this.lastName = elem['lastName'];
    this.phoneNumber = elem['phoneNumber'];
    return this;
  }
}
