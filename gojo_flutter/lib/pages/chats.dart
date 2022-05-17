import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
    List<Map> _searched =
        _messages.where((user) => user["name"].contains(query)).toList();
    setState(() {
      _foundChats = _searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Messages"),
          // search should be here.
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // // height: 38,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: TextField(
                  onChanged: (value) => _search(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      // prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.search),
                      hintText: "Search"),
                ),
              ),
            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                            _foundChats[index]["url"]),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Text(
                                              "new message it should have been but as we all know sometimes the message's length can be dubious",
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        child: Text("1"),
                                        radius: 10,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "9:00",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text("No Users have been found"),
                      )),
          ],
        ));
  }
}
