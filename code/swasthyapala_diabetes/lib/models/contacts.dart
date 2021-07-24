class EmergencyContact {
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _phoneNumber;

  EmergencyContact.name(
    this._firstName,
    this._middleName,
    this._lastName,
    this._phoneNumber,
  );
  EmergencyContact();

  //  Convert a Contact into a Map. The keys must correspond to the names of the
  // columns in the database.

  Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'middleName': this.middleName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
    };
  }

  EmergencyContact fromJson(Map<String, dynamic> elem) {
    this.firstName = elem['firstName'];
    this.middleName = elem['middleName'];
    this.lastName = elem['lastName'];
    this.phoneNumber = elem['phoneNumber'];
    return this;
  }

  String? get firstName {
    return _firstName;
  }

  String? get middleName {
    return _middleName;
  }

  String? get lastName {
    return _lastName;
  }

  String? get phoneNumber {
    return _phoneNumber;
  }

  set firstName(f) {
    _firstName = f;
  }

  set middleName(m) {
    _middleName = m;
  }

  set lastName(l) {
    _lastName = l;
  }

  set phoneNumber(pN) {
    _phoneNumber = pN;
  }
}
