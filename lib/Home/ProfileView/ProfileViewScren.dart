import 'package:flutter/material.dart';
import 'package:sporty_app/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: (){
            cacheHelper.removeData(key: "token").then((value) {
              if(value){
                Navigator.pushNamed(context,LogInScreen.ROUTE_NAME);
              }
            });
          },
          child: Text("sign out"),
        ),
      ),
    );
  }
}
