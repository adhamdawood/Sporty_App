class CreditCardModel {
  String creditCardNumber;
  String expirationDate;
  String zipcode;

  CreditCardModel({this.creditCardNumber, this.expirationDate, this.zipcode});

  factory CreditCardModel.fromJson(Map<String, dynamic> json) => CreditCardModel(
      creditCardNumber : json['creditCardNumber'] as String,
      expirationDate : json['expirationDate'] as String,
      zipcode : json['zipcode'] as String
  );

  static List<CreditCardModel> getCards(dynamic cards) {
    if (cards != null) {
      List<CreditCardModel> creditCard = [];
      cards.forEach((v) {
        creditCard.add(new CreditCardModel.fromJson(v));
      });

      return creditCard;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creditCardNumber'] = this.creditCardNumber;
    data['expirationDate'] = this.expirationDate;
    data['zipcode'] = this.zipcode;
    return data;
  }
}