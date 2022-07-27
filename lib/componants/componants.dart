
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_screen.dart';


 String ApiUrl="http://ahmedssaleem-001-site1.etempurl.com";


TrainingProgramsWidget(data,context){
  return Container(
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SingleTrainingScreen(id: data.trainingProgramId)),);
          },

          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
             width: MediaQuery.of(context).size.width  ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image:  DecorationImage(image:NetworkImage(data.imageUrl.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height:7,),
        Row(
          children: [
            Container(
              width: 200,
              child: Text(data.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,

                ),
              ),
            ),
            // Spacer(),
            // Icon(Icons.star,color: Color(0xffFFC107),),
            // Text('4.6',
            //   style: TextStyle(
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black
            //   ),
            // ),
          ],
        ),

        SizedBox(height: 7.0,),
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
ProductsWidget(data,context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>SingleProductScreen(id: data.productId)),);

              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width  ,
               // height: 170.0, width: 165.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image:  DecorationImage(image:  NetworkImage(data.imageUrl.toString(),),  fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
           // SizedBox(height: 2),
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsetsDirectional.only(start: 10.0,top: 3.0),
            //       child: Icon(Icons.star,color: Color(0xffFFC107),),
            //     ),
            //     SizedBox(width: 2.0,),
            //     Padding(
            //       padding:  EdgeInsetsDirectional.only(top: 5.0),
            //       child: Text('4.6',
            //         style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Color(0xffFFC107)),),),
            //   ],
            // ),
          ],
        ),
        SizedBox(height: 4,),
        Text(data.name.toString(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,),
        ),
        SizedBox(height: 4,),

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

Chat(String massage,int data){
  return data==0?Row(
    children: [
      Container(
        margin: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/robot.png"),
        ),
      ),
      Container(
        width: 210,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1),
          borderRadius: BorderRadius.circular(18),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(20),
        child: Container(
          child: Text(
            massage,
            maxLines: 100,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ],
  ) : Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(

          decoration: BoxDecoration(
            color: Color.fromRGBO(63, 136, 197, 1),
            borderRadius: BorderRadius.circular(18),
          ),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(20),
          child: Text(
           massage,
            maxLines: 100,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          )

      ),
    ],
  );
}


  Future<bool> flutterToast({String msg}){
  return  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFE20030),
      textColor: Colors.white,
      fontSize: 16.0
  );
  }




