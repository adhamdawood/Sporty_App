
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


 String ApiUrl="http://ahmedssaleem-001-site1.etempurl.com";


TrainingProgramsWidget(data){
  return Container(
    width: double.maxFinite,
    height: 400,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(image:  NetworkImage(data.imageUrl.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Container(
              width: 200,
              child: Text(data.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,

                ),
              ),
            ),
            Spacer(),
            Icon(Icons.star,color: Color(0xffFFC107),),
            Text('4.6',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
          ],
        ),

        SizedBox(height: 5.0,),
        Row(
          children: [
            Text(data.level,
              style: TextStyle(
                  color: Colors.grey
              ),),
            SizedBox(width: 8.0,),
            Container(
              height: 10.0,
              width: 1.0,
              color: Color(0xffE20030),
            ),
            SizedBox(width: 8.0,),
            ///
            Text(data.sportName,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
ProductsWidget(data){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              height: 150.0, width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:  DecorationImage(image:  NetworkImage(data.imageUrl.toString(),), // fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.0,top: 3.0),
                  child: Icon(Icons.star,color: Color(0xffFFC107),),
                ),
                SizedBox(width: 2.0,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: 5.0),
                  child: Text('4.6',
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Color(0xffFFC107)),),),
              ],
            ),
          ],
        ),
        Text(data.name.toString(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(data.brand.toString(),
                style: TextStyle(color: Colors.grey),),
            ),
            SizedBox(width: 5,),
            Container(
              height: 10.0,
              width: 1.0,
              color: Color(0xffE20030),
            ),
            SizedBox(width: 8.0,),
            Text('${data.price.toString()}\$',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
            ),
          ],
        ),

      ],
    ),
  );
}

// Widget tabOfSport({String name}){
//   bool onClick=true;
//     return onClick? Container(
//       width: 100,
//       height: 50,
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(child: Text(name,style: TextStyle(fontSize: 14,color: Colors.black),)),
//     ):Container(
//       width: 100,
//       height: 50,
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Color(0xff3f88c5),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(child: Text(name,style: TextStyle(fontSize: 14,color: Colors.white),)),
//     );
//   }

  Future<bool> flutterToast({String msg}){
  return  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFE20030),
      textColor: Colors.white,
      fontSize: 16.0
  );
  }

//   Future<bool> checkRefreshToken() async {
//   String refreshToken =cacheHelper.sharedPreferences.getString("refreshToken");
//   var body = jsonEncode({
//     'Token':refreshToken,
//   });
//   var url = Uri.parse(
//       'http://Sporty.somee.com/api/Auth/refreshToken/');
//   final response = await http.post(url,
//       body: body, headers: {
//         "content-type": "application/json",
//         "Accept": "application/json",
//       });
//   if (response.statusCode == 200) {
//       NewTokenFromResetingPassword  nEw =await NewTokenFromResetingPassword.fromJson(jsonDecode(response.body));
//       cacheHelper.saveData(key: "refreshToken", value: nEw.refreshToken);
//     return true;
//   } else {
//     print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
//     return false;
//   }
// }


