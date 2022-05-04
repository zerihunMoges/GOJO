// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'chats/chat.dart';
void main(List<String> args) {
  runApp(Gojo());
}

class Gojo extends StatelessWidget {
  const Gojo({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Renting app",
      debugShowCheckedModeBanner: false,
      home: Chat(),
    );
  }
}