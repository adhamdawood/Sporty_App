import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';
import 'package:sporty_app/Home/ProfileView/CreditCards.dart';
import 'package:sporty_app/Home/ProfileView/ProfileInformation.dart';

class ProfileScreen extends StatelessWidget {
  static const ROUTE_NAME = "Profile screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),

        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/ManWithHead.png")),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
            child: Text(
              'sergio aguero',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Text(
            'sergioaguero@legend.com',
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
          ),
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {Navigator.of(context).pushNamed(ProfileInformation.ROUTE_NAME);},
                    icon: Row(
                      children: [
                        Icon(Icons.person,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Profile information'))
                      ],
                    ))),
          ),
    SizedBox(
    height: 15,
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {Navigator.of(context).pushNamed(CreditCards.ROUTE_NAME);},
                    icon: Row(
                      children: [
                        Icon(Icons.credit_card,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Credit card'))
                      ],
                    ))),
          ),

    SizedBox(
    height: 15,
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.history,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Order history'))
                      ],
                    ))),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.history_edu_sharp, color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Booking history'))
                      ],
                    ))),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.logout,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Log out'))
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
