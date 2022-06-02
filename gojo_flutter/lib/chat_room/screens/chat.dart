import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

class Chat extends StatelessWidget {
  List<Message> messages = [
    Message(
        Content: "Hi jenny wilson how you doin'...",
        SentByMe: false,
        date: DateTime.now().subtract(Duration(minutes: 1))),
    Message(
        Content: "Hey adem hows everything..",
        SentByMe: true,
        date: DateTime.now().subtract(Duration(minutes: 2))),
    Message(
        Content: "i am looking for a suitable place to live in",
        SentByMe: false,
        date: DateTime.now().subtract(Duration(minutes: 3))),
    Message(
        Content: "simply dummy text of the printing industry. ",
        SentByMe: true,
        date: DateTime.now().subtract(Duration(minutes: 4))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 16, 32),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Jenny Wilson"),
        backgroundColor: Color.fromARGB(255, 1, 24, 48),
        elevation: 10.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
            child: Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color.fromARGB(236, 0, 85, 244),
                    size: 28,
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(116, 41, 46, 87),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
            child: GroupedListView<Message, DateTime>(
          padding: EdgeInsets.all(8),
          reverse: true,
          order: GroupedListOrder.DESC,
          floatingHeader: true,
          elements: messages,
          groupBy: (message) => DateTime(
            message.date.month,
            message.date.day,
          ),
          groupHeaderBuilder: (Message message) => SizedBox(
            height: 40,
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromARGB(255, 3, 37, 66),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    DateFormat.MMMd().format(message.date),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (context, Message message) => Align(
            alignment:
                message.SentByMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Bubble(
              nipWidth: 9,
              nipHeight: 6,
              margin: const BubbleEdges.only(top: 5),
              nip: (message.SentByMe == false
                  ? BubbleNip.leftBottom
                  : BubbleNip.rightBottom),
              color: (message.SentByMe == false
                  ? Color.fromARGB(116, 29, 45, 84)
                  : Color.fromARGB(255, 38, 83, 197)),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  message.Content,
                  style: TextStyle(color: Color.fromARGB(255, 248, 242, 242)),
                ),
              ),
            ),
          ),
        )),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(116, 38, 44, 87),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Type message...",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color.fromARGB(37, 46, 53, 104),
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 31, 97, 249),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Message {
  final String Content;
  final bool SentByMe;
  final DateTime date;

  Message({
    required this.Content,
    required this.SentByMe,
    required this.date,
  });
}
