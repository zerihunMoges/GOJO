import 'package:flutter/material.dart';

class SearchPost extends StatefulWidget {
  const SearchPost({Key? key}) : super(key: key);

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  final List<Map> _posts = [
    {
      "name": "HENOK",
      "url": "assets/melancholy.png",
      "location": "22 Mazoriya"
    },
    {
      "name": "HENOK",
      "url": "assets/melancholy.png",
      "location": "22 Mazoriya"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
