import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({Key? key}) : super(key: key);

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  final List<Map> _messages = [
    {"name": "HENOK", "url": "assets/melancholy.png"},
    {"name": "DAWIT", "url": "assets/melancholy.png"},
    {"name": "KIDUS", "url": "assets/melancholy.png"},
    {"name": "JIM", "url": "assets/melancholy.png"},
    {"name": "ARROW", "url": "assets/melancholy.png"}
  ];

  List<Map> _foundChats = [];

  @override
  void initState() {
    super.initState();
    _foundChats = _messages;
  }

  void _search(String query) {
    List<Map> _searched = _messages
        .where((user) =>
            user["name"].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _foundChats = _searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _foundChats.isNotEmpty
              ? ListView.builder(
                  itemCount: _foundChats.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1,
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
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
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage(_foundChats[index]["url"]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _foundChats[index]["name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Container(
                                    //   width: MediaQuery.of(context).size.width *
                                    //       0.45,
                                    //   child: Text(
                                    //     "new message it should have been but as we all know sometimes the message's length can be dubious",
                                    //     style: TextStyle(
                                    //       color: Colors.grey[600],
                                    //       overflow: TextOverflow.ellipsis,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
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
                        "The Uset doesn't exist.",
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
