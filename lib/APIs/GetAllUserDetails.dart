/// id : "ad8c63f0-dca4-42b4-9ce4-0e87e2ad045c"
/// name : "ahmed waeel"
/// email : "ahmedwaell.889@gmail.com"
/// address : {"city":"Alex","street":"Wekalat El-Lamon","buildingNumber":8,"mobileNumber":"01090794168"}
/// creditCards : [{"creditCardId":"5e0650de-81c4-4721-b726-2387429c143e","creditCardNumber":"4616908381384025","expirationDate":"12/2024","zipcode":"11511"}]

class GetAllUserDetails {
  GetAllUserDetails({
      String id, 
      String name, 
      String email, 
      Address address, 
      List<CreditCards> creditCards,}){
    _id = id;
    _name = name;
    _email = email;
    _address = address;
    _creditCards = creditCards;
}

  GetAllUserDetails.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['creditCards'] != null) {
      _creditCards = [];
      json['creditCards'].forEach((v) {
        _creditCards.add(CreditCards.fromJson(v));
      });
    }
  }
  String _id;
  String _name;
  String _email;
  Address _address;
  List<CreditCards> _creditCards;
GetAllUserDetails copyWith({  String id,
  String name,
  String email,
  Address address,
  List<CreditCards> creditCards,
}) => GetAllUserDetails(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  address: address ?? _address,
  creditCards: creditCards ?? _creditCards,
);
  String get id => _id;
  String get name => _name;
  String get email => _email;
  Address get address => _address;
  List<CreditCards> get creditCards => _creditCards;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    if (_address != null) {
      map['address'] = _address.toJson();
    }
    if (_creditCards != null) {
      map['creditCards'] = _creditCards.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// creditCardId : "5e0650de-81c4-4721-b726-2387429c143e"
/// creditCardNumber : "4616908381384025"
/// expirationDate : "12/2024"
/// zipcode : "11511"

class CreditCards {
  CreditCards({
      String creditCardId, 
      String creditCardNumber, 
      String expirationDate, 
      String zipcode,}){
    _creditCardId = creditCardId;
    _creditCardNumber = creditCardNumber;
    _expirationDate = expirationDate;
    _zipcode = zipcode;
}

  CreditCards.fromJson(dynamic json) {
    _creditCardId = json['creditCardId'];
    _creditCardNumber = json['creditCardNumber'];
    _expirationDate = json['expirationDate'];
    _zipcode = json['zipcode'];
  }
  String _creditCardId;
  String _creditCardNumber;
  String _expirationDate;
  String _zipcode;
CreditCards copyWith({  String creditCardId,
  String creditCardNumber,
  String expirationDate,
  String zipcode,
}) => CreditCards(  creditCardId: creditCardId ?? _creditCardId,
  creditCardNumber: creditCardNumber ?? _creditCardNumber,
  expirationDate: expirationDate ?? _expirationDate,
  zipcode: zipcode ?? _zipcode,
);
  String get creditCardId => _creditCardId;
  String get creditCardNumber => _creditCardNumber;
  String get expirationDate => _expirationDate;
  String get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creditCardId'] = _creditCardId;
    map['creditCardNumber'] = _creditCardNumber;
    map['expirationDate'] = _expirationDate;
    map['zipcode'] = _zipcode;
    return map;
  }

}

/// city : "Alex"
/// street : "Wekalat El-Lamon"
/// buildingNumber : 8
/// mobileNumber : "01090794168"

class Address {
  Address({
      String city, 
      String street, 
      int buildingNumber, 
      String mobileNumber,}){
    _city = city;
    _street = street;
    _buildingNumber = buildingNumber;
    _mobileNumber = mobileNumber;
}

  Address.fromJson(dynamic json) {
    _city = json['city'];
    _street = json['street'];
    _buildingNumber = json['buildingNumber'];
    _mobileNumber = json['mobileNumber'];
  }
  String _city;
  String _street;
  int _buildingNumber;
  String _mobileNumber;
Address copyWith({  String city,
  String street,
  int buildingNumber,
  String mobileNumber,
}) => Address(  city: city ?? _city,
  street: street ?? _street,
  buildingNumber: buildingNumber ?? _buildingNumber,
  mobileNumber: mobileNumber ?? _mobileNumber,
);
  String get city => _city;
  String get street => _street;
  int get buildingNumber => _buildingNumber;
  String get mobileNumber => _mobileNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['street'] = _street;
    map['buildingNumber'] = _buildingNumber;
    map['mobileNumber'] = _mobileNumber;
    return map;
  }

}