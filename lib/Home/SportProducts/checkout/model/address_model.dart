class AddressModel {
  String city;
  String street;
  int buildingNumber;

  AddressModel({this.city, this.street, this.buildingNumber});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      city : json['city'] as String,
      street : json['street'] as String,
      buildingNumber : json['buildingNumber'] as int
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['buildingNumber'] = this.buildingNumber;
    return data;
  }
}
