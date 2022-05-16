import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/ProfileView/ProfileViewScreen.dart';

class ProfileInformation extends StatefulWidget {
  static const ROUTE_NAME = "Profile info";
  String firstName, lastName, email, city, street, mobileNumber;
  int bNumber;
  ProfileInformation({this.firstName,this.lastName,this.email,this.street,this.city,this.bNumber,this.mobileNumber});

  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final myController = TextEditingController();
  Future<GetUserDetails> userDetails;

  void initState()  {
    // TODO: implement initState
    super.initState();

    // var _data = getDetails()
    //     .then((value) => myController.text = value.name.split(' ').first);
    // myController.addListener(() {
    //   widget.firstName = myController.text;
    //   print('onAddListener: ${myController.text}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile information',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height*.85,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.firstName,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'First name',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              widget.firstName = value;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.lastName,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Last name',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              widget.lastName = value;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.email,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              widget.email = value;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.city!=null?widget.city:" ",
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'City',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              widget.city = value;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.street!=null?widget.street:" ",
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Street',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onSaved:  (value) {
                            setState(() {
                              widget.street = value;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue:
                          widget.bNumber.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Building',
                              labelStyle: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              widget.bNumber = int.parse(value);
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          initialValue: widget.mobileNumber!=null?widget.mobileNumber:" ",
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),

                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Mobile number',
                              labelStyle: TextStyle(color: Colors.grey)),
                          maxLength: 11,

                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              widget.mobileNumber = value;
                            });
                          },
                        )),


                  ],
                ),
              ),
            ),

          ),



          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),

              child: TextButton(
                onPressed: () {
                  if(widget.mobileNumber.length!=11)
                    return Fluttertoast.showToast(
                        msg: "Please insert the full number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor:  const Color(0xFFE20030),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  else
                  if(widget.street==""||widget.firstName== "" ||
                  widget.lastName==""||
                  widget.email==""||
                  widget.city==""||

                  widget.mobileNumber==""
                  ) return Fluttertoast.showToast(
                      msg: "Please insert the user details correctly",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor:  const Color(0xFFE20030),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  else
                  setState(() {
                    userDetails = updateAlbum(
                      widget.firstName,
                      widget.lastName,
                      widget.email,
                      widget.city,
                      widget.street,
                      widget.mobileNumber,
                      widget.bNumber,

                    );
                    Navigator.of(context)
                        .pushReplacementNamed(ProfileScreen.ROUTE_NAME);
                  });

                },

                child: const Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),

    );
    /*FutureBuilder<GetUserDetails>(
        future: userDetails,
        builder: (buildContext, snapShot) {
          if (snapShot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Profile information',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.name.split(' ').first,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'First name',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                         setState(() {
                           widget.firstName = value;
                         });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.name.split(' ').last,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'Last name',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                         setState(() {
                           widget.lastName = value;
                         });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.email,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                         setState(() {
                           widget.email = value;
                         });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.address!=null?snapShot.data.address.city:" ",
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'City',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                         setState(() {
                           widget.city = value;
                         });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.address!=null?snapShot.data.address.street:" ",
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'Street',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onSaved:  (value) {
                         setState(() {
                           widget.street = value;
                         });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue:
                        snapShot.data.address!=null?snapShot.data.address.buildingNumber.toString():" ",
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'Building',
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                         setState(() {
                           widget.bNumber = value as int;
                         });
                        },
                      )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE20030),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            userDetails = updateAlbum(
                                widget.firstName,
                                widget.lastName,
                                widget.email,
                                widget.city,
                                widget.street,
                                7);
                          });
                          Navigator.of(context)
                              .pushReplacementNamed(ProfileScreen.ROUTE_NAME);
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });*/

/*return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile information',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'First name',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Last name',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    labelText: 'Street',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    labelText: 'Building',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              )
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(

              width: double.infinity,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),


              child: TextButton(
                onPressed: (){},
                child: const Text("Update",style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),
    );*/

}



Future<GetUserDetails> updateAlbum(String firstName, String lastName,
    String email, String city, String street, String mobileNumber,int bNumber) async {
  final response = await http.put(
    Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/users/profile'),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1MzAyM2E1YS1jYTVjLTRhNGQtODUzMC01NmVjZGVkZWRkMzYiLCJlbWFpbCI6ImFobWVkd2FlbC44ODlAZ21haWwuY29tIiwidWlkIjoiYWQ4YzYzZjAtZGNhNC00MmI0LTljZTQtMGU4N2UyYWQwNDVjIiwiZXhwIjoxNjU3NzE3NzExLCJpc3MiOiJUZXN0SldUQXBpIiwiYXVkIjoiVGVzdEpXVEFwaVVzZXIifQ.fnUvVChTZWq5pZ9iYLsrjv1qaEhctvgr7k5pS73s-84',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: widget.city!=null? jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': {'city': city, 'street': street, 'buildingNumber': bNumber, 'mobileNumber' : mobileNumber}
    }
    ):jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,

    }
  ));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return GetUserDetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(response.body);
  }
}
}
