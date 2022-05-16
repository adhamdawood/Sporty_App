import 'dart:convert';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/user_payment_data_model.dart';
import 'package:sporty_app/Home/SportProducts/consttt.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Models/Widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:http/http.dart' as http;

UserPaymentDataModel dataModel;

var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI4NDVmZDk4Yy1jMmE1LTQzYWEtYjNlNy05NDkxZDE2ZmY1MWMiLCJlbWFpbCI6Im1vaGFtZWRzYWRrLjg4OUBnbWFpbC5jb20iLCJ1aWQiOiJlMTRhMGYxZS04MmUzLTRiN2EtYjVkMi05OTgxZjcyMmE0YzEiLCJleHAiOjE2NTYwNjk0MDgsImlzcyI6IlRlc3RKV1RBcGkiLCJhdWQiOiJUZXN0SldUQXBpVXNlciJ9.H0CSfFzmMY5CYaiyxsrBQyYdQMxnIqlVhTeP8pg6Zkc';

 Future<UserPaymentDataModel> fetchUserPaymentData() async {
  final response =
  await http.get(Uri.parse('${ApiUrl}/api/users/payment-data'),
      headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
  );

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("in fetch ${jsonResponse.runtimeType}");
    var model = UserPaymentDataModel.fromJson(jsonResponse as Map<String, dynamic>);
    print("after calling ${model.address} ${model.creditCard}");
    if(model.address == null){
      model.address = new AddressModel(street: "Enter your Address", buildingNumber: 0, city: "");
    }
    print("after address ${model.address.street}");
    //////////////////acheHelperr.insertAddress(model.address, token);
    return model;
  } else {
    print('${response.body} ${response.statusCode}');
    throw Exception('${response.body} ${response.statusCode}');
  }


}

UserPaymentDataModel getUserPaymentDataNotFuture() {
  return dataModel;
}
