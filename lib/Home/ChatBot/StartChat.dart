import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class StartChat extends StatelessWidget {
  static String ROUTE_NAME = "StartChatScreen";
  final messageInsert = TextEditingController();
  List<Map> messsages = List();
  void response(String query) async{
    var request = http.Request('POST', Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/chat-bot?message=${query}'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'chatbot',
                    style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 10,
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(63, 136, 197, 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text(
                          'Hi, i am Abdelrahman',
                          style: TextStyle(color: Colors.white),
                        ),

                      ],
                    )

                  ),
                ],
              ),
              Row(
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
                        'Hi, Abdelrahman                 Can i help you with something?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
                Container(
                  padding: EdgeInsets.only(left: 8) ,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageInsert,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(247, 247, 247, 1),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              hintText: 'Type a message...'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 136, 197, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                            onPressed: (){response(messageInsert.text);
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
