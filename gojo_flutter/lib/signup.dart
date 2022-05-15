// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: <Widget>[ 
          Row( mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Align( alignment: Alignment.centerRight,
                    child: Icon(
                        Icons.house_rounded,
                        size: 70,
                        color: Color.fromARGB(255, 3, 48, 88), 
                      ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB( 0, 42, 25, 0 ),
                child: Align( alignment: Alignment.centerRight,
                  child: Text( 
                    "GOJO",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                      ),
                   ),
                ),
              ),
            ],
          ),
              
          Image.network(
            'https://i.pinimg.com/originals/70/ff/46/70ff46c0fe8b2e15f87730dfd1a38a00.gif',
            width: 200,
            height: 100,
          ),
          
          Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 60,),
          // phone number and entry field
          SizedBox(
            width: 280,
            height: 30,
             child: Text(
                "Phone number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
           ),
          SizedBox(
            width: 260,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.grey[200], filled: true,
                enabledBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 228, 227, 227), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          // password and entry field
          SizedBox(height: 15,),
          SizedBox(
            width: 280,
            height: 30,
             child: Text(
                "Password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
           ),
           SizedBox(
            width: 260,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.grey[200], filled: true,
                enabledBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 228, 227, 227), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 15,),
          // confirm password and entry field
          SizedBox(
            width: 280,
            height: 25,
             child: Text(
                "Confirm password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
           ),
          SizedBox(
            width: 260,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.grey[200], filled: true,
                enabledBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 228, 227, 227), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 35,),
          ButtonTheme(
            minWidth: 110,
            height: 37,
          // ignore: deprecated_member_use
            child: RaisedButton(  
              textColor: Colors.white,  
              color: Color.fromARGB(255, 3, 48, 88),  
              child: Text(
                'Sign Up', style: TextStyle(
                  fontSize: 17
                ),),  
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
              onPressed: (){},  
            ),
          ),         
        ],
      ), 
    ); 
  }
}