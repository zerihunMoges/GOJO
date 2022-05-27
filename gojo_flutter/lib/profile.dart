import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
    leading: IconButton(
      onPressed: (){},
      icon: Icon(Icons.arrow_back, color: Colors.lightBlue,)),
      
      title: Text("Edit Profile",  style: TextStyle(color: Colors.black)),

    ),

    body: Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height:15),
          Center(
            
            child: Stack(
            
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 58,
              backgroundImage: AssetImage('assets/food_1.jpeg'),
    ),
        Positioned(
          height: 35, width: 35, bottom: 0, right: -3,
          child: RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.white,
              child: Icon(
                Icons.camera_alt,
                size: 19,
                color: Colors.grey.shade600,
               ),
      
        shape: CircleBorder(
          side: BorderSide(width: 2, color: Colors.grey.shade200, style: BorderStyle.solid),
        ),
      )
      )
          
          ]),
          ),
          SizedBox(height: 15,),
          const Divider(
           
            thickness: 0.1,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          SizedBox(height: 15,),
          ProfileForm()

        ],
      )
    )
    );
  }
}


class ProfileForm extends StatefulWidget {
  const ProfileForm({ Key? key }) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Full Name", style: TextStyle(color: Colors.black45, fontSize: 16, ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5,color: Colors.black38),
                
              ),
    
              height: 50,
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  border: InputBorder.none ,
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Full Name", style: TextStyle(color: Colors.black45, fontSize: 16, ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5,color: Colors.black38),
                
              ),
    
              height: 50,
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  border: InputBorder.none ,
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ),

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Full Name", style: TextStyle(color: Colors.black45, fontSize: 16, ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5,color: Colors.black38),
                
              ),
    
              height: 50,
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  border: InputBorder.none ,
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ),

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Full Name", style: TextStyle(color: Colors.black45, fontSize: 16, ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5,color: Colors.black38),
                
              ),
    
              height: 50,
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  border: InputBorder.none ,
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ),

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Full Name", style: TextStyle(color: Colors.black45, fontSize: 16, ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5,color: Colors.black38),
                
              ),
    
              height: 50,
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: "Enter a message",
                  border: InputBorder.none ,
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ),

            
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}