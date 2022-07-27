import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_model.dart';

Future<List<MydataModel>> searchData(String query) async {
  final response =
  await http.get(Uri.parse('http://mohamedsadk889-001-site1.etempurl.com/api/training_programs?searchQuery='+query),
      headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5ZDgwZTAyOS0xZmYyLTRlZDAtYjRhZC1kYzFjYmU4Nzc4MzAiLCJlbWFpbCI6Im1vaGFtZWRzYWRrLjg4OUBnbWFpbC5jb20iLCJ1aWQiOiJmNTU1MmRjMS0zZWJiLTQ5NjctYWM2NC1hZTlmNzgyOWQyMTciLCJleHAiOjE2NTE5MzA1NzMsImlzcyI6IlRlc3RKV1RBcGkiLCJhdWQiOiJUZXN0SldUQXBpVXNlciJ9.Vlc_al2IA6XqlZm2LwPrvS8kctpi67nmEeCPvG8ydv4'}
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => MydataModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}





