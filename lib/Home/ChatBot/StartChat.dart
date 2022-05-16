import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sporty_app/Models/Widgets.dart';

import '../../Providers/ChatBotProvider.dart';


class StartChat extends StatefulWidget {
  static String ROUTE_NAME = "StartChatScreen";

  @override
  State<StartChat> createState() => _StartChatState();
}

class _StartChatState extends State<StartChat> {
  chatProvider chat_Provider;
  final messageInsert = TextEditingController();

  @override
  Widget build(BuildContext context) {
     chat_Provider = Provider.of<chatProvider>(context);
    return MaterialApp(
      home: Container(
        child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          appBar: AppBar(
            backgroundColor: Color(0xffFFFFFF),
            title: InkWell(
              onTap: (){Navigator.pop(context);},
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20,),
                  Text('chatbot',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(width: 8,),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 10,),],
              ),
            ),
          ),
          body: Column(
            children: [
              Flexible(
                flex: 60,
                  child: ListView.builder(
                      reverse: true,
                      itemCount: chat_Provider.messsages.length,
                      itemBuilder: (context, index) => Chat(
                          chat_Provider.messsages[index]["message"].toString(),
                          chat_Provider.messsages[index]["data"]))),

              Spacer(),
                Container(
                  padding: EdgeInsets.only(left: 8) ,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0x33f7f7f7),
                          ),
                          child: TextFormField(
                            controller: messageInsert,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xff8E8E93)
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),),
                                hintText: 'Type a message...',),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 136, 197, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                            onPressed: () async{
                              if (messageInsert.text.isEmpty) {
                                print("empty message");
                              } else  {
                                var message = messageInsert.text;
                                await chat_Provider.sendMessage(messageInsert.text);
                                messageInsert.clear();
                                await chat_Provider.response(message);

                              }
                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                            },
                            icon: ImageIcon(AssetImage("assets/images/arrow.png"),color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
