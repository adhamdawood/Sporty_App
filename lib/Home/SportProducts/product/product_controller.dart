import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/Home/SportProducts/product/product_model.dart';

import '../../../componants/componants.dart';

Future<ProductModel> singleProductData({ String id}) async {

  final response = await http.get(Uri.parse('${ApiUrl}/api/products/'+id),
      headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'},
  );
  if (response.statusCode == 200) {

    dynamic jsonResponse = json.decode(response.body);
    var model =  ProductModel.fromJson(jsonResponse as Map<String, dynamic>);

      //  model.description = model.description!.substring(0,100);
    return model;
  } else {
    throw Exception('Unexpected error occured!');
  }
}