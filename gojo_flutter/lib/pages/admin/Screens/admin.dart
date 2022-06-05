import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojo_flutter/pages/admin/Screens/admin_posts.dart';
import 'package:gojo_flutter/pages/admin/Screens/admin_users.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Users",
                  icon: Icon(
                    Icons.person,
                    color: Colors.indigoAccent,
                  ),
                ),
                Tab(
                  text: "Posts",
                  icon: Icon(
                    Icons.house,
                    color: Colors.indigoAccent,
                  ),
                ),
                Tab(
                  text: "Statistics",
                  icon: Icon(
                    Icons.bar_chart_outlined,
                    color: Colors.indigoAccent,
                  ),
                ),
              ],
            ),
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
                    "Admin",
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: CupertinoSearchTextField(
                          prefixInsets: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          onChanged: (value) => _search(value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // search should be here.
          ),
          body: TabBarView(
            children: [
              AdminUsers(),
              AdminPost(),
              Icon(Icons.not_interested),
            ],
          ),
        ),
      ),
    );
  }
}
