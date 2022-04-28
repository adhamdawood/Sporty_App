import 'package:sporty_app/Home/SportProducts/checkout/model/CreditCardModel.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';

class UserPaymentDataModel {
  AddressModel address;
  List<CreditCardModel> creditCard;

  UserPaymentDataModel({this.address, this.creditCard});

  factory UserPaymentDataModel.fromJson(Map<String, dynamic> json) => UserPaymentDataModel(
      address : json['address'] != null ? new AddressModel.fromJson(json['address']) : null,
      creditCard: json['creditCard'] != null ? CreditCardModel.getCards(json['creditCard']) : []
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.creditCard != null) {
      data['creditCard'] = this.creditCard.map((v) => v.toJson()).toList();
    }
    return data;
  }
}