import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/componants/consttt.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/mydata_model.dart';

class TrainingProvider extends ChangeNotifier {
  List<TrainingModel> allPrograms, searchTraining;

 // List<TrainingModel> model = new TrainingModel() as List<TrainingModel>;

//   setData(List<TrainingModel> data ){
// model = data;
//   }
//   List<TrainingModel> getData (){
//     return model;
//   }
  ///http://sportyapi.somee.com

  Future<List<TrainingModel>> fetchDataa() async {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    final response =
    await http.get(Uri.parse('${baseApi}/api/programs'),
        headers: {
          'Authorization': 'Bearer ${cacheHelper.sharedPreferences.getString(
              "token")}'
        }
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      allPrograms =
          jsonResponse.map((data) => TrainingModel.fromJson(data)).toList();

      searchTraining = allPrograms;

      notifyListeners();

      return allPrograms;


    }

    else {

      throw Exception('Unexpected error o*ccured!');
    }
  }

  List<TrainingModel> searchItems(String searchParam){


    searchTraining = allPrograms.where((product) {
      final sportName = product.sportName.toLowerCase();
      final productName = product.name.toLowerCase();
      final searchParamLowered = searchParam.toLowerCase();

      return sportName.contains(searchParamLowered) ||
          productName.contains(searchParamLowered) ;
    }).toList();
    notifyListeners();
    return searchTraining;
  }

  List<TrainingModel> filterItems(String filterParam){
    if(filterParam == "All"){
      searchTraining = allPrograms;
      notifyListeners();
      return searchTraining;
    }
    searchTraining = allPrograms.where((training) {
      final sportName = training.sportName.toLowerCase();

      return sportName == filterParam.toLowerCase();
    }).toList();

    notifyListeners();
    return searchTraining;
  }

}

