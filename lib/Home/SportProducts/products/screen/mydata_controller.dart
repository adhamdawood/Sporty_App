import 'dart:convert';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_model.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:http/http.dart' as http;

  List<MydataModel> allProducts ;
Future<List<MydataModel>> fetchData() async {
  final response =
  await http.get(Uri.parse('http://Sporty.somee.com/api/products'),
     headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    allProducts = jsonResponse.map((data) => MydataModel.fromJson(data)).toList();
    return allProducts;
  } else {
    throw Exception('Unexpected error o*ccured!');
  }
}

 List<MydataModel> getAllProduct(){
  return allProducts;
 }