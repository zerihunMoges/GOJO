import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPost extends StatefulWidget {
  const AdminPost({Key? key}) : super(key: key);

  @override
  State<AdminPost> createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
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
    return Column(
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
                          children: [
                            Text("shit"),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width: MediaQuery.of(context).size.width *
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      iconSize: 18,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.indigoAccent,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 18,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
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
    );
  }
}
