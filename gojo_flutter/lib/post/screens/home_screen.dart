import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/auth/bloc/auth_bloc.dart';
import 'package:gojo_flutter/auth/bloc/auth_state.dart';
import 'package:gojo_flutter/post/bloc/bloc.dart';
import 'package:gojo_flutter/post/dataprovider/post_data.dart';
import 'package:gojo_flutter/post/models/post.dart';
import 'package:gojo_flutter/post/repository/post_repository.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  // List pages = [
  //   Profile(User(
  //       email: "tolos",
  //       firstname: "ahmed",
  //       lastname: "kod",
  //       id: 1,
  //       username: "fdkjfkd")),
  //   Profile(User(
  //       email: "tolos",
  //       firstname: "ahmed",
  //       lastname: "kod",
  //       id: 1,
  //       username: "fdkjfkd")),
  //   Profile(User(
  //       email: "tolos",
  //       firstname: "ahmed",
  //       lastname: "kod",
  //       id: 1,
  //       username: "fdkjfkd")),
  //   ProfileSetting(),
  //   PostDetail(),
  // ];
  bool _isFilteron = false;
  RangeValues _currentRangeValues = const RangeValues(1000, 1000000);
  RangeValues _currentareaRangeValues = const RangeValues(100, 8000);
  PostRepository postRepository =
      PostRepository(dataProvider: PostDataProvider());
  List<Post>? posts;
  final PostBloc postBloc =
      PostBloc(PostRepository(dataProvider: PostDataProvider()))
        ..add(PostLoad());
  var searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget filter = Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price Range",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          RangeSlider(
            values: _currentRangeValues,
            max: 1000000,
            divisions: 1000,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text("Area Range",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          RangeSlider(
            values: _currentareaRangeValues,
            max: 8000,
            divisions: 100,
            labels: RangeLabels(
              _currentareaRangeValues.start.round().toString(),
              _currentareaRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentareaRangeValues = values;
              });
            },
          ),
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 88, 155, 241),
                  onSurface: Colors.grey,
                  padding: EdgeInsets.all(20)),
              onPressed: () {
                setState(() {
                  _isFilteron = !_isFilteron;
                });
                postBloc
                        ..add(PostFilter( priceRange: [
                            _currentRangeValues.start,
                            _currentRangeValues.end
                          ], area: [
                            _currentareaRangeValues.start,
                            _currentareaRangeValues.end
                          ], type:'', posts: posts!,query: searchCtrl.text,userid: ''));
              },
              child: Text("Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
        ],
      ),
    );

    return BlocProvider(
      create: (_) => postBloc,
      child: Scaffold(
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: CupertinoSearchTextField(
                        onChanged: (query) {
                          postBloc
                        ..add(PostFilter( priceRange: [
                            _currentRangeValues.start,
                            _currentRangeValues.end
                          ], area: [
                            _currentareaRangeValues.start,
                            _currentareaRangeValues.end
                          ], type:'', posts: posts!,query: searchCtrl.text,userid: ''));
                        },
                        controller: searchCtrl,
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
                              onPressed: () {
                                setState(() {
                                  _isFilteron = !_isFilteron;
                                });
                              },
                              icon: Icon(
                                Icons.filter_list_rounded,
                              )),
                        ),
                      )
                    ],
                  )),
              _isFilteron == true
                  ? filter
                  : Container(
                      height: 0,
                    ),
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            color: Color.fromARGB(221, 41, 40, 40),
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ]),
              ),
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    clipBehavior: Clip.antiAlias,
                    child: Opacity(
                        opacity: 0.9,
                        child: Image.asset("homeimage.jpg",
                            fit: BoxFit.cover,
                            color: Color.fromARGB(75, 0, 0, 0),
                            colorBlendMode: BlendMode.overlay)),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 40,
                    child: Text(
                      "Welcome To Gojo",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromARGB(76, 0, 0, 0),
                          fontWeight: FontWeight.w900,
                          fontSize: 40),
                    ))
              ]),
              Container(
                height: 140,
                child: ListView(
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push("/posts", extra: [posts, "House"]);
                      },
                      child: Container(
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
                                backgroundColor:
                                    Color.fromARGB(255, 233, 235, 252),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push("/posts", extra: [posts, "Villa"]);
                      },
                      child: Container(
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
                                backgroundColor:
                                    Color.fromARGB(255, 233, 235, 252),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push("/posts", extra: [posts, "Apartment"]);
                      },
                      child: Container(
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
                                backgroundColor:
                                    Color.fromARGB(255, 233, 235, 252),
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
                              backgroundColor:
                                  Color.fromARGB(255, 233, 235, 252),
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
                        "For You",
                        style: TextStyle(
                            color: Color.fromARGB(221, 41, 40, 40),
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ]),
              ),
              Container(
                height: 263,
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (_, state) {
                    if (state is PostOperationFailure) {
                      return Center(
                        child: Text("Failed"),
                      );
                    }
                    if (state is PostLoadSuccess) {
                      this.posts = state.posts;
                    }

                    if (state is PostLoadSuccess ||
                        state is PostFilterSuccess) {
                      print(state.posts);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 10),
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          Post post = state.posts[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/post', extra: post);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
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
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15)),
                                              clipBehavior: Clip.antiAlias,
                                              child: Opacity(
                                                  opacity: 0.9,
                                                  child: Image.memory(
                                                    post.photo,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color.fromARGB(
                                                        171, 189, 187, 187)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "4.5",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Color.fromARGB(
                                                          255, 250, 230, 55),
                                                    )
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: 5,
                                          right: 10,
                                          bottom: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 25,
                                                child: TextButton(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                      padding: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Color.fromARGB(
                                                              255, 65, 84, 252),
                                                          style: BorderStyle
                                                              .solid),
                                                    ),
                                                    child: Text(
                                                      "Apartment",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 65, 84, 252),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    post.price.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 65, 84, 252),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    "/${post.payment_frequency}",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 151, 161, 253),
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                            post.title,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
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
                                                color: Color.fromARGB(
                                                    255, 88, 97, 179),
                                                size: 15,
                                              ),
                                              Text(
                                                post.location,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        206, 29, 29, 29),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12),
                                              ),
                                              Expanded(child: SizedBox()),
                                              IconButton(
                                                splashRadius: 20,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_border,
                                                  color: Color.fromARGB(
                                                      255, 88, 97, 179),
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
                            ),
                          );
                        },
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is! LoginSuccessful) {
              return Text("Login");
            }
            return BottomNavigationBar(
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
                      Icons.add_business,
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
                });

                if (_idx == 3) {
                  context.push("/settings", extra: state.userId);
                }
                if (_idx == 2) {
                  context.push("/chats", extra: state.userId);
                }
                if (_idx == 1) {
                  context.push("/createPost", extra: state.userId);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
