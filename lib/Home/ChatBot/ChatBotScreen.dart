import 'package:flutter/material.dart';
import 'package:sporty_app/Home/ChatBot/StartChat.dart';

class ChatBot extends StatelessWidget {
  static String ROUTE_NAME = "ChatBotWelcomeScreen";

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image(
                  image: AssetImage("assets/images/BotWelcome.png"),
                  width: 250,
                  height: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hello to chatbot',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                      child: Text(
                          'You can start to chatting with your Chatbot and you will get the answers easily',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey,fontSize: 18))),
                ),
              ],
            ),
          ),
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
                onPressed: (){
                  Navigator.of(context).pushNamed(StartChat.ROUTE_NAME);
                },
                child: const Text(
                  "Start Chat",
                  style: TextStyle(color: Colors.white),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
