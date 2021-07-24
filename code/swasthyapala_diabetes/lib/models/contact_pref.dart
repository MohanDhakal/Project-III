class ContactPref {
  String? _phoneNumber;
  int? _mealPref;
  int? _emerPref;

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': this.phoneNumber,
      'mealInfo': this.mealPref,
      'emerInfo': this.emerPref
    };
  }

  ContactPref fromJson(Map<String, dynamic> elem) {
    this.phoneNumber = elem['phoneNumber'];
    this.emerPref = elem['emerInfo'];
    this.mealPref = elem['mealInfo'];
    return this;
  }

  set phoneNumber(pN) {
    _phoneNumber = pN;
  }

  set mealPref(mP) {
    _mealPref = mP;
  }

  set emerPref(eP) {
    _emerPref = eP;
  }

  int? get mealPref {
    return _mealPref;
  }

  int? get emerPref {
    return _emerPref;
  }

  String? get phoneNumber {
    return _phoneNumber;
  }
}
