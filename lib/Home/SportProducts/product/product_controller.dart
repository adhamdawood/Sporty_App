import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/product/product_model.dart';

Future<ProductModel> singleProductData({ String id}) async {

  final response = await http.get(Uri.parse('http://Sporty.somee.com/api/products/'+id),
      headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5ZDgwZTAyOS0xZmYyLTRlZDAtYjRhZC1kYzFjYmU4Nzc4MzAiLCJlbWFpbCI6Im1vaGFtZWRzYWRrLjg4OUBnbWFpbC5jb20iLCJ1aWQiOiJmNTU1MmRjMS0zZWJiLTQ5NjctYWM2NC1hZTlmNzgyOWQyMTciLCJleHAiOjE2NTE5MzA1NzMsImlzcyI6IlRlc3RKV1RBcGkiLCJhdWQiOiJUZXN0SldUQXBpVXNlciJ9.Vlc_al2IA6XqlZm2LwPrvS8kctpi67nmEeCPvG8ydv4'},
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