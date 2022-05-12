import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/product/product_model.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_model.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

Future<SingleTrainingModel> singleTrainingData({ String id}) async {

  final response = await http.get(Uri.parse('http://Sporty.somee.com/api/programs/'+id),
      headers: {'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'},
  );
  if (response.statusCode == 200) {

    dynamic jsonResponse = json.decode(response.body);
    var model =  SingleTrainingModel.fromJson(jsonResponse as Map<String, dynamic>);

      //  model.description = model.description!.substring(0,100);
    return model;
  } else {
    throw Exception('Unexpected error occured!');
  }
}