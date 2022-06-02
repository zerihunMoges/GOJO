// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(top : 150.0, left:55, right: 80),
          child: Form(
            key: formKey,
            child: Column( 
              children: <Widget>[ 
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 3, 48, 88), 
                  ),
                ),
          
                SizedBox(height: 60,),
                // phone number and entry field
                SizedBox(
                  width: 230,
                  height: 30,
                   child: Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
          
                TextFormField(          
                  keyboardType: TextInputType.number,      
                  decoration: InputDecoration(
                    labelText: 'Enter Phone number' ,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder(                    
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "please enter your phone number";
                    }
                    return null;
                  },
                ),
                // password and entry field
                SizedBox(height: 15,),
                SizedBox(
                  width: 230,
                  height: 30,
                   child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                 ),
                 TextFormField( 

                  controller: password, 
                  keyboardType: TextInputType.text,           
                  decoration: InputDecoration(
                    labelText: 'Enter password' ,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder(                    
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter a password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                // confirm password and entry field
                SizedBox(
                  width: 240,
                  height: 25,
                   child: Text(
                      "Confirm password",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                 ),
                SizedBox(height: 3,),

                TextFormField(

                  controller: confirmpassword,
                  keyboardType: TextInputType.text,  
                  obscureText: true,           
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder(                    
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "please enter password";
                    }
                    if (password.text != confirmpassword.text){
                      return "password doesn't match";
                    }
                    return null;
                  },
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
                    onPressed: (){
                      if( formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Successful'))
                        );
                      }
                    },  
                  ),
                ),         
              ],
            ),
          ),
        ),
      ), 
    ); 
  }
}