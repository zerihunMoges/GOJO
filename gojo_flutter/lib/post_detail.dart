// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  
  const PostDetail({ Key? key }) : super(key: key);

  @override
  
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column( 
        children: [
          Expanded(
            flex: 0,
            child: Container( 
              child: Stack( 
                children: [ 
                  SizedBox( 
                    width: 500,
                    height: 250,
                    child: Image.asset(
                      "assets/house.jpg",
                      fit: BoxFit.fill,),
                  ),
                ],
              ) ,
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: 430,
                  color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 18, 0),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owent Apartment", 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column( 
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children: [
                                    Container( 
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(245, 227, 236, 255),
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.bed,
                                          size: 18,
                                          color: Colors.blue,
                                          ),
                                      ), 
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "4 Beds", 
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15, 
                                      ),
                                    )
                                  ],
                                ),                                
                              ],
                            ),
                            Column( 
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children: [
                                    Container( 
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(245, 227, 236, 255),
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.bathtub_outlined,
                                          size: 18,
                                          color: Colors.blue,
                                          ),
                                      ), 
                                    ),
                                    SizedBox(width: 14,),
                                    Text(
                                      "2 Bath", 
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15
                                      ),
                                    )
                                  ],
                                ),                                
                              ],
                            ),
                            Column( 
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children: [
                                    Container( 
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(245, 227, 236, 255),
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.area_chart_sharp,
                                          size: 18,
                                          color: Colors.blue,
                                          ),
                                      ), 
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "1984 sqft", 
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15
                                      ),
                                    )
                                  ],
                                ),                                
                              ],
                            ),
                            SizedBox(width:10 ,)
                            
                          ],
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 31,
                                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTV4zEAVnzgkgv_t3d8wvW1NdVziSnTQsbzw&usqp=CAU"),
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Albert Flores",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  )),
                                Text(
                                  "Partner",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                ),
                              ],
                            ),
                            SizedBox(width:80,),
                            FloatingActionButton( 
                              backgroundColor:Color.fromARGB(245, 227, 236, 255),
                              onPressed: null,  
                              child: Icon(
                                Icons.message,
                                size: 26,
                                color: Colors.blue,
                              ), 
                            ),                            
                          ],
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),),
                          ]
                        ),             
                        SizedBox( height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        'assets/home.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ),                                        
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),),
                          ]
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Living Area",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  '1,989 sqft',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),)
                              ],
                            )                        
                          ],
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Type",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Modern',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )                        
                          ],
                        ), 
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  '45000 Birr',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )                        
                          ],
                        ),
                        Container(
                          height: 1.8,
                          color: Colors.grey[300],
                        ),        
                      ]
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),     
    );
  }
}