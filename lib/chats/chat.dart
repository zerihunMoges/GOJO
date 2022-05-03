// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenny Wilson"),
      ),
      body: SafeArea(
        child: Container(
          child: Card(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Type message.."),
                Icon(Icons.telegram)
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}