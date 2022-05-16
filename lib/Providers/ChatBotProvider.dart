import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class chatProvider extends ChangeNotifier{
  List<Map> messsages = <Map>[];

  Future<String> response(String query) async{
    var url = Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/chat-bot?message=${query}');
    final response = await http.post(url,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      var message = jsonResponse["message"];
      print(message);

      messsages.insert(0, {
      "data": 0,
      "message": message
    });
     await notifyListeners();

     return message;
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void sendMessage(String query)async{
     messsages.insert(0,
       {"data": 1, "message": query});

     await notifyListeners();

  }


}