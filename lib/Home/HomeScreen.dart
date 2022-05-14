import 'package:flutter/material.dart';
import 'package:sporty_app/Home/AllProductsAndTraining.dart';
import 'package:sporty_app/Home/ChatBot/ChatBotScreen.dart';
import 'package:sporty_app/Home/ProfileView/ProfileViewScren.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/screen_products.dart';
import 'package:sporty_app/Home/TrainingProgram/TrainingScreen.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/trainings.dart';


class HomePage extends StatefulWidget {
  static String  ROUTE_NAME="Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
      clipBehavior: Clip.hardEdge,
      notchMargin: 10,
      child: BottomNavigationBar(
         backgroundColor:const Color(0xffF7F7F7),
        selectedItemColor: const Color(0xffE20030),
        unselectedItemColor: const Color(0xffA2AEBB),
        currentIndex: selectedIndex,
        selectedIconTheme: const IconThemeData(size: 30,),
        onTap: (selectedIndex){
          setState(() {
            this.selectedIndex=selectedIndex;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              label: "Products",
            icon: ImageIcon(AssetImage("assets/images/Products.png")),),
          BottomNavigationBarItem(
              label: "Training",
              icon: ImageIcon(AssetImage("assets/images/Training.png",),),),
          BottomNavigationBarItem(
            label: "Home",
            icon: ImageIcon(AssetImage("assets/images/Home.png")),),
          BottomNavigationBarItem(
              label: "ChatBot",
            icon: ImageIcon(AssetImage("assets/images/chatBot.png")),),
          BottomNavigationBarItem(
              label: "Profile",
            icon: ImageIcon(AssetImage("assets/images/Profile.png")),)
        ],
    ),),
    body: Body(),
    );
  }
  Widget Body(){
    if(selectedIndex==0) {return ProductScreen();}
    else if (selectedIndex==1) {return TrainingScreen();}
    else if (selectedIndex==2) {return AllProductsAndTraining();}
    else if (selectedIndex==3) {return ChatBot();}
    else if (selectedIndex==4) {return ProfileView();}
  }
}
