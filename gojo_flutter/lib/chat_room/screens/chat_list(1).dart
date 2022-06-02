import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chat_room.dart';
import 'package:http/http.dart' as http;

class ChatList extends StatelessWidget {
  final ChatBloc chatBloc = ChatBloc(ChatRepository(ChatDataProvider()));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => chatBloc,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            title: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoSearchTextField(
                    borderRadius: BorderRadius.circular(24),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            // search should be here.
          ),
          body: Column(
            children: [
              Expanded(child: BlocBuilder<ChatBloc, ChatState>(
                builder: (_, ChatState state) {
                  if (state is ChatLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ChatsLoadingFailure) {
                    return Center(
                      child: Text("Couldn't load the Chats"),
                    );
                  }
                  if (state is ChatsLoadSuccess) {
                    return state.chats.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.chats.length,
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
                                                "assets/melancholy.png"),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.chats[index].owner2,
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
                                                  state
                                                      .chats[index].lastMessage,
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                            state.chats[index].time,
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
                                  "The User doesn't exist.",
                                  style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              )
                            ],
                          );
                  }

                  return Text("never get here");
                },
              )),
            ],
          )),
    );
  }
}
