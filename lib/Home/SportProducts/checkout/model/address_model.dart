class AddressModel {
  String city;
  String street;
  String MobileNumber;
  int buildingNumber;

  AddressModel({this.city, this.street, this.buildingNumber, this.MobileNumber});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      city : json['city'] as String,
      street : json['street'] as String,
      MobileNumber : json['MobileNumber'] as String,
      buildingNumber : json['buildingNumber'] as int
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['MobileNumber'] = this.MobileNumber;
    data['buildingNumber'] = this.buildingNumber;
    return data;
  }
}
