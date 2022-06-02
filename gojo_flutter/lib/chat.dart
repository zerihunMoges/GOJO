// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

class Chat extends StatefulWidget {
   
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Message> messages = [
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hey adem hows everything..", SentByMe: true,date: DateTime.now().subtract(Duration(minutes: 2))),
    Message(Content: "i am looking for a suitable place to live in", SentByMe: false,date: DateTime.now().subtract(Duration(minutes: 3))),
    Message(Content: "simply dummy text of the printing industry. ", SentByMe: true, date:DateTime.now().subtract(Duration(minutes: 4)) ),
    Message(Content: "dummy text of the printing industry. ", SentByMe: true, date:DateTime.now().subtract(Duration(minutes: 5)) ),
    Message(Content: " text of the printing industry. ", SentByMe: true, date:DateTime.now().subtract(Duration(minutes: 6)) ),
    Message(Content: "the printing industry. ", SentByMe: true, date:DateTime.now().subtract(Duration(minutes: 5)) ),
    Message(Content: "print of the printing industry. ", SentByMe: true, date:DateTime.now().subtract(Duration(minutes: 4)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    Message(Content: "Hi jenny wilson how you doin'...", SentByMe: false, date:DateTime.now().subtract(Duration(minutes: 1)) ),
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold ( backgroundColor:Color.fromARGB(255, 239, 239, 239), 
      appBar: AppBar(toolbarHeight: 70,
        title: Text(
          "Jenny Wilson", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),),
        backgroundColor: Colors.grey[200], 
        elevation: 2.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) =>SizedBox(
                height: 40,
                child: Align(
                  child: Center(
                    child: Card(     
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),              
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          DateFormat.MMMd().format(message.date),
                          style: TextStyle(color: Colors.grey[600]),
                        ), 
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.SentByMe ?Alignment.centerRight: Alignment.centerLeft,
                child: Bubble( 
                  nipWidth: 9,
                  nipHeight: 6,
                  margin: const BubbleEdges.only(top: 5),
                      nip: (message.SentByMe == false?BubbleNip.leftBottom:BubbleNip.rightBottom),
                      color: (message.SentByMe  == false?Colors.white: Color.fromARGB(122, 3, 48, 88) ),
                  child:Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        message.Content,
                        style: TextStyle(color: Colors.black87),), 
                    ),
                ),
              ),
            )
          ),
          //message to be sent 
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8,),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height:55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row( 
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Type message.........",
                          hintStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 18),
                          border: InputBorder.none
                        ),
                      ),
                    ),          
                    SizedBox(
                      height: 40,
                      child: FloatingActionButton( backgroundColor:Colors.white,
                        onPressed: ( ){},
                        child: Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 31, 97, 249),
                            size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class Message{
  final String Content;
  final bool SentByMe;
  final DateTime date;
  
  Message({required this.Content, required this.SentByMe,required this.date, });
}