import 'dart:convert';

import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/componants/consttt.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/mydata_model.dart';

  List<TrainingModel> allProducts ;
Future<List<TrainingModel>> fetchDataa() async {
  final response =
  await http.get(Uri.parse('${baseApi}/api/programs'),
     headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    allProducts = jsonResponse.map((data) => TrainingModel.fromJson(data)).toList();
    return allProducts;
  } else {
    throw Exception('Unexpected error o*ccured!');
  }
}

 List<TrainingModel> getAllProduct(){
  return allProducts;
 }