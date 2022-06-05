import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gojo_flutter/post/models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  Map<String, IconData> roomIcon = {
    "BedRoom": Icons.bed,
    "BathRoom": Icons.bathtub_outlined,
  };
  PostDetail(@required this.post);

  @override
  Widget build(BuildContext context) {
    List gallery = [];
    for (var gal in post.rooms) {
      for (var pho in gal.photos) {
        gallery.add(Uint8List.fromList(List<int>.from(pho)) );
      }
      
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.35,
                    width:  MediaQuery.of(context).size.width,
                    child: Image.memory(
                      post.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 20, 18, 0),
                      // ignore: prefer_const_literals_to_create_immutables
                      child:
                          ListView(scrollDirection: Axis.vertical, children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            post.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (var room in post.rooms)
                              Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                245, 227, 236, 255),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                          child: Icon(
                                            Icons.bed,
                                            size: 24,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "${room.count}  ${room.type}",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                        ),
                                      ),
                                       SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              245, 227, 236, 255),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Icon(
                                          Icons.area_chart_sharp,
                                          size: 24,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${post.area} sqft",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 31,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTV4zEAVnzgkgv_t3d8wvW1NdVziSnTQsbzw&usqp=CAU"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text("${post.location}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                Text("Partner",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(245, 227, 236, 255),
                              onPressed: null,
                              child: Icon(
                                Icons.message,
                                size: 26,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gallery.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.memory(
                                       Uint8List.fromList(List<int>.from(gallery[index])),
                                       fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1.6,
                          color: Colors.grey[200],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Living Area",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  '${post.area} sqft',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Type",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  '${post.price} Birr',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
