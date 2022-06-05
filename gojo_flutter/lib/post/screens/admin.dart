import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/post/bloc/bloc.dart';
import './admin_posts.dart';
import '../../auth/index.dart';
import '../dataprovider/data_provider.dart';
import '../repository/repository.dart';
import '../../user/index.dart';

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
        length: 2,
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
              ],
            ),
            toolbarHeight: 120,
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
                ],
              ),
            ),
            // search should be here.
          ),
          body: BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(AuthenticationRepo(AuthenticationRemote())),
            child: TabBarView(
              children: [
                BlocProvider(
                  create: (context) {
                    return UserBloc(
                      UserRepository(
                        dataProvider: UserDataProvider(),
                      ),
                    )..add(UserLoad());
                  },
                  child: AdminUsers(),
                ),
                BlocProvider<PostBloc>(
                    create: (context) => PostBloc(
                        PostRepository(dataProvider: PostDataProvider()))
                      ..add(PostLoad()),
                    child: AdminPost()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
