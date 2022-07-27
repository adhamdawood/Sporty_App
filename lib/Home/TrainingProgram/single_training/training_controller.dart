import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/componants/consttt.dart';
import 'package:sporty_app/modules/TrainingProgram/single_training/training_model.dart';

Future<SingleTrainingModel> singleTrainingData({ String id}) async {

  final response = await http.get(Uri.parse('${baseApi}/api/programs/'+id),
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

Future<dynamic> enrollToAProgram(String id) async{
  var headers = {
    'Authorization': 'Bearer ${cacheHelper.sharedPreferences.getString("token")}'
  };
  var request = http.Request('POST', Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/programs/${id}/enroll'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }
}

