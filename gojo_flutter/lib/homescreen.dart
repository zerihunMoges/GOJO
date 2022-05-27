import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojo_flutter/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  List pages = [
    Profile(),
    Profile(),
    Profile(),
    Profile(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SearchBar(),
            Container(
              height: 140,
              child: ListView(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 30, top: 20, right: 30, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 0.5,
                            color: Color.fromARGB(255, 170, 187, 216))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.house_rounded,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "House",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 30, top: 20, right: 30, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 0.5,
                            color: Color.fromARGB(255, 170, 187, 216))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.villa,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Villa",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 30, top: 20, right: 30, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 0.5,
                            color: Color.fromARGB(255, 170, 187, 216))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.apartment,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Apartment",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 30, top: 20, right: 30, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 0.5,
                            color: Color.fromARGB(255, 170, 187, 216))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 233, 235, 252),
                            child: Icon(
                              Icons.group,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Room Mate",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                          color: Color.fromARGB(221, 41, 40, 40),
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900,
                              fontSize: 15),
                        )),
                  ]),
            ),
            Container(
              height: 263,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      side: BorderSide(
                          width: 0.25,
                          color: Color.fromARGB(151, 153, 152, 152),
                          style: BorderStyle.solid),
                    ),
                    elevation: 0,
                    child: Container(
                      width: 200,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Opacity(
                                    opacity: 0.9,
                                    child: Image.asset(
                                      "assets/food_1.jpeg",
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(171, 189, 187, 187)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color:
                                              Color.fromARGB(255, 250, 230, 55),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 5, right: 10, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: TextButton(
                                          clipBehavior: Clip.antiAlias,
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            side: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 65, 84, 252),
                                                style: BorderStyle.solid),
                                          ),
                                          child: Text(
                                            "Apartment",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 84, 252),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10),
                                          )),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "1800",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 65, 84, 252),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "/month",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 151, 161, 253),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "This is the Title",
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 88, 97, 179),
                                      size: 15,
                                    ),
                                    Text(
                                      "Addis ababa, Ethiopia",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(206, 29, 29, 29),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Color.fromARGB(255, 88, 97, 179),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Near By Me",
                      style: TextStyle(
                          color: Color.fromARGB(221, 41, 40, 40),
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900,
                              fontSize: 15),
                        )),
                  ]),
            ),
            Container(
              height: 263,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      side: BorderSide(
                          width: 0.25,
                          color: Color.fromARGB(151, 153, 152, 152),
                          style: BorderStyle.solid),
                    ),
                    elevation: 0,
                    child: Container(
                      width: 200,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Opacity(
                                    opacity: 0.9,
                                    child: Image.asset(
                                      "assets/food_1.jpeg",
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(171, 189, 187, 187)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color:
                                              Color.fromARGB(255, 250, 230, 55),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 5, right: 10, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: TextButton(
                                          clipBehavior: Clip.antiAlias,
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            side: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 65, 84, 252),
                                                style: BorderStyle.solid),
                                          ),
                                          child: Text(
                                            "Apartment",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 84, 252),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10),
                                          )),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "1800",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 65, 84, 252),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "/month",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 151, 161, 253),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "This is the Titlev",
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 88, 97, 179),
                                      size: 15,
                                    ),
                                    Text(
                                      "Addis ababa, Ethiopia",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(206, 29, 29, 29),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Color.fromARGB(255, 88, 97, 179),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 53, 40, 235),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 53, 40, 235),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 53, 40, 235),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger,
              color: Color.fromARGB(255, 53, 40, 235),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 53, 40, 235),
            ),
            label: "",
          ),
        ],
        currentIndex: _idx,
        onTap: (int index) {
          setState(() {
            _idx = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return pages[index];
            }));
          });
        },
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
                child: CupertinoSearchTextField(
              prefixInsets: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(30),
            )),
            SizedBox(
              width: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(221, 224, 223, 223),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_rounded,
                    )),
              ),
            )
          ],
        ));
  }
}
