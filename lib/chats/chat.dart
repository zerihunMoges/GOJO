// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'chatMessage.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hi jenny wilson...", messageType: "sender"),
    ChatMessage(messageContent: "Hey adem..", messageType: "receiver"),
    ChatMessage(messageContent: "i am looking for a suitable place to live in", messageType: "sender"),
    ChatMessage(messageContent: "simply dummy text of the printing industry. ", messageType: "receiver"),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor:Color.fromARGB(255, 0, 15, 29), 
      appBar: AppBar(toolbarHeight: 70,
        title: Text("Jenny Wilson"),
        backgroundColor: Color.fromARGB(255, 0, 16, 32), 
        elevation: 10.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 5, 14),
            child: Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 13, 123, 214),)
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 36, 65),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(9, 13, 13, 13),
            child: Container( alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 36, 65),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {}, 
                icon: Icon( 
                  Icons.video_call,
                  size: 28,
                  color: Color.fromARGB(255, 13, 123, 214),)
              ),
            ),
          )
        ],
      ),
      body: 
      Stack( 
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Text(messages[index].messageContent),
              );
            },
          ),
          Align(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10,),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType  == "receiver"?Color.fromARGB(255, 29, 59, 85):Colors.blue[400]),
                      ),
                padding: EdgeInsets.all(12),
                child: Text(
                  messages[index].messageContent, 
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white), 
                  ),
        ),
      ),
    );
  },
),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height:70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 27, 49),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row( 
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message...",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none
                        ),
                      ),
                    ),                    
                    FloatingActionButton( backgroundColor:Color.fromARGB(255, 2, 27, 49),
                      onPressed: () {  },
                      child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}