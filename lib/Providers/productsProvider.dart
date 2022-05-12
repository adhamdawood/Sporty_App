import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_model.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

class productProvider extends ChangeNotifier{

  List<MydataModel> allProducts ;

  Future<List<MydataModel>> fetchData() async {
    print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
    final response =
    await http.get(Uri.parse('http://Sporty.somee.com/api/products'),
        headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
    );
    notifyListeners();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("ssssssssssssssssssssssssssssssssss");
      allProducts =await jsonResponse.map((data) => MydataModel.fromJson(data)).toList();
      return allProducts;
    } else {
      throw Exception('Unexpected error o*ccured!');
    }
  }

}