import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sporty_app/Home/SportProducts/consttt.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_model.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{

  List<MydataModel> allProducts, searchProducts ;

  Future<List<MydataModel>> fetchData() async {
  final response =
  await http.get(Uri.parse('${baseApi}/api/products'),
  headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
  );

  if (response.statusCode == 200) {
  List jsonResponse = json.decode(response.body);
  allProducts = jsonResponse.map((data) => MydataModel.fromJson(data)).toList();
  searchProducts = allProducts;
  notifyListeners();

  return allProducts;
  } else {
  throw Exception('Unexpected error o*ccured!');
  }
  }

  List<MydataModel> searchItems(String searchParam){
    searchProducts = allProducts.where((product) {
      final sportName = product.sportName.toLowerCase();
      final productName = product.name.toLowerCase();
      final productBrand = product.brand.toLowerCase();
      final searchParamLowered = searchParam.toLowerCase();

      return sportName.contains(searchParamLowered) ||
          productName.contains(searchParamLowered) || productBrand.contains(searchParamLowered);
    }).toList();
    notifyListeners();
    return searchProducts;
  }

  List<MydataModel> filterItems(String filterParam){
    if(filterParam == "All"){
      searchProducts = allProducts;
     // searchProducts.sort((a,b)=>a.price.compareTo(b.price));
      notifyListeners();
      return searchProducts;
    }

    searchProducts = allProducts.where((training) {
      final sportName = training.sportName.toLowerCase();

      return sportName == filterParam.toLowerCase();
    }).toList();

    notifyListeners();
    return searchProducts;
  }

}
