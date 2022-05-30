import 'package:flutter/material.dart';


class ProfileSetting extends StatelessWidget {
  const ProfileSetting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
    leading: IconButton(
      onPressed: (){},
      icon: Icon(Icons.arrow_back, color: Colors.lightBlue,)),
      
      title: Text("Setting",  style: TextStyle(color: Colors.black)),

    ),

    body: Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height:15),
          Row(
            children: [
              SizedBox(width: 20,),
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
              SizedBox(width: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Denis Ivey", style: TextStyle(
                      fontWeight: FontWeight.w900, 
                      fontSize: 20,

                    ),),
                    SizedBox(height:10),
                    Text("andreqgrarner@gmail.com", style: TextStyle(
                      color: Colors.black38, 
                      
                    ),),
                    SizedBox(height: 10,),
                    Text("Ethiopia", style: TextStyle(
                      color: Colors.black38, 
                      
                    ),)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          const Divider(
           
            thickness: 0.1,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
              SizedBox(width: 20,),
              Text("Edit Profile", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 20,
                    ),),
              Expanded(child: SizedBox()),

              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 20,)

            ],
          ),
          SizedBox(height: 10,),
          const Divider(
           
            thickness: 0.05,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.help,
                              size: 30,
                            ),
                          ),
              SizedBox(width: 20,),
              Text("Help", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 20,
                    ),),
              Expanded(child: SizedBox()),

              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 20,)

            ],
          ),
          SizedBox(height: 10,),
          const Divider(
           
            thickness: 0.05,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 240, 158, 147),
                            child: Icon(
                              Icons.logout,
                              size: 30,
                              color:  Color.fromARGB(255, 247, 31, 3),
                              
                            ),
                          ),
              SizedBox(width: 20,),
              Text("Logout", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 20,
                    ),),
              Expanded(child: SizedBox()),

              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 20,)

            ],
          ),
          SizedBox(height: 10,),
          

        

        ],
      )
    )
    );
  }
}