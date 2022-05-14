import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/user_payment_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

import '../../consttt.dart';
import '../model/CreditCardModel.dart';

class CheckoutProvider extends ChangeNotifier {
  UserPaymentDataModel userPayment;
  List <Map> products;


  Future<UserPaymentDataModel> fetchDataa() async {
    final response = await http.get(
      Uri.parse('${baseApi}/api/users/payment-data'),
      headers: {
        'Authorization':
            'Bearer ${cacheHelper.sharedPreferences.getString("token")}'
      },
    );
    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      userPayment =
          UserPaymentDataModel.fromJson(jsonResponse as Map<String, dynamic>);

      notifyListeners();
      //  model.description = model.description!.substring(0,100);
      return userPayment;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  List<Map<dynamic, dynamic>> makeProductsObject(){
    List<Map<dynamic, dynamic>> productListObject = <Map<dynamic, dynamic>>[];
    for(int i = 0; i < products.length; i++){
      Map<dynamic, dynamic> object = {
        "productId" : products[i]["ProductId"],
        "amount" : products[i]['Counter'],
        "totalItemPrice": products[i]['Price'] * products[i]['Counter']
      };

      productListObject.add(object);
    }

    return productListObject;
  }

  void makeApiOrder(double total) async{
    var headers = {
      'Authorization': 'Bearer ${cacheHelper.sharedPreferences.getString("token")}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/orders'));
    request.body = json.encode({
      "address": {
        "city": userPayment.address.city,
        "street": userPayment.address.street,
        "buildingNumber": userPayment.address.buildingNumber,
        "mobileNumber" : userPayment.address.MobileNumber
      },
      "creditCard": {
        "creditCardNumber": userPayment.creditCard[0].creditCardNumber,
        "expirationDate": userPayment.creditCard[0].expirationDate,
        "zipcode": userPayment.creditCard[0].zipcode
      },
      "totalPrice": total,
      "products": makeProductsObject()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }

  void moveData (String city, String street, int building, String mobile){
    userPayment.address = new AddressModel(city: city, street: street, buildingNumber: building, MobileNumber: mobile);
    notifyListeners();
  }

  void setCreditCard(String creditCardNum, String expirationDate, String zipCode){
    if(userPayment.creditCard == null || userPayment.creditCard.length == 0){
      userPayment.creditCard = <CreditCardModel>[];
      userPayment.creditCard.add(new CreditCardModel(creditCardNumber: creditCardNum,
          expirationDate: expirationDate, zipcode: zipCode));
      notifyListeners();
    }
    else{
      userPayment.creditCard[0] = new CreditCardModel(creditCardNumber: creditCardNum,
          expirationDate: expirationDate, zipcode: zipCode);
      notifyListeners();
    }

  }

}
