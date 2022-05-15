import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/login_response.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/SportProducts/consttt.dart';
import 'package:sporty_app/Models/Widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

import '../SignUp/SignUpScreen.dart';

class LogInScreen extends StatefulWidget {

  static const ROUTE_NAME = "Login screen";

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  Future <LoginResponse> loginResponse;
  String email,password;
  int onSignInButton=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loginResponse = LoadResponse();
  }
  @override
  Widget build(BuildContext context) {
        return  FutureBuilder<LoginResponse>(
                future: loginResponse,
                builder: (context,snapshot){
                  if (snapshot.hasData){
                   cacheHelper.saveData(key: "token", value: snapshot.data.token);
                   cacheHelper.saveData(key: "refreshToken", value : snapshot.data.refreshToken);
                    return HomePage();
                  }else {
                    return Scaffold(
                      body: Container(
                        height: double.infinity,
                        width: double.infinity,
                        margin: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/welcomeScreen.png", fit: BoxFit.fill,),
                            const Text("Welcome Hero, Sign In To Continue",
                              style: TextStyle(fontSize: 14),),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "E-mail",
                                labelText: 'E-mail *',
                              ),
                              onChanged : (value) {
                                email=value;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                labelText: 'Password *',
                              ),
                              onChanged: (value) {
                                password=value;
                              },
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (_) => ForgetPasswordScreen()));
                                },
                                child: const Text("Forget Password ?", textAlign: TextAlign.end,)),
                            Container(
                              width: 296, height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE20030),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    loginResponse= loadResponse();
                                  });
                                  onSignInButton=1;
                                },
                                child: const Text(
                                  "Sign In", style: TextStyle(color: Colors.white),),),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                              },
                              child: const Text.rich(
                                TextSpan(
                                  text: "Don't Have An Account ?", // default text style
                                  children: <TextSpan>[
                                    TextSpan(text: ' Sign Up ',
                                      style: TextStyle(color: Color(0xFFE20030),
                                          fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                );
      }
  Future<LoginResponse> loadResponse() async {
    var body = jsonEncode({
      'email':email,
      'password': password,
    });
    var url = Uri.parse(
        '${ApiUrl}/api/Auth/login');
    final response = await http.post(url,
        body: body, headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {

      return await LoginResponse.fromJson(jsonDecode(response.body));
    } else if(response.statusCode==400&&onSignInButton==1) {
     flutterToast( msg: "Email or Password is Incorrect");
      throw(Exception(response.body));
    }
  }
  }

