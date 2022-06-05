// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPost extends StatefulWidget {
  const SearchPost({Key? key}) : super(key: key);

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  final List<Map> _posts = [
    {
      "title": "apartment",
      "url": "assets/melancholy.png",
      "location": "22 Mazoriya"
    },
    {"title": "NO Name", "url": "assets/melancholy.png", "location": "Bole"},
    {"title": "HENOK", "url": "assets/melancholy.png", "location": "Megenagna"},
    {"title": "HENOK", "url": "assets/melancholy.png", "location": "Kotebe"},
    {
      "title": "HENOK",
      "url": "assets/melancholy.png",
      "location": "22 Mazoriya"
    },
  ];

  List<Map> _foundPosts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundPosts = _posts;
  }

  void _search(String query) {
    List<Map> _searched = _posts
        .where((user) =>
            user["title"]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            user["location"]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
    setState(() {
      _foundPosts = _searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 160,
          backgroundColor: Colors.white,
          // shadowColor: Colors.white,
          title: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: CupertinoSearchTextField(
                        prefixInsets: EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        onChanged: (value) => _search(value),
                      ),
                    ),
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        splashRadius: 18.0,
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list_rounded,
                          color: Colors.indigoAccent[400],
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search Results",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      _foundPosts.isNotEmpty
                          ? "${_foundPosts.length} found"
                          : "0 found",
                      style: TextStyle(
                        color: Colors.indigoAccent[400],
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // search should be here.
        ),
        body: Column(
          children: [
            Expanded(
              child: _foundPosts.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundPosts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 5, bottom: 5, right: 20, left: 20),
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            _foundPosts[index]["url"],
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _foundPosts[index]["title"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          child: Text(
                                            _foundPosts[index]["location"],
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              radius: 50,
                              child: Icon(
                                Icons.sentiment_very_dissatisfied,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "The Post doesn't exist.",
                            style: TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ));
  }
}
