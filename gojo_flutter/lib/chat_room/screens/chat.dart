import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/auth/bloc/auth_bloc.dart';
import 'package:gojo_flutter/auth/bloc/auth_state.dart';
import 'package:gojo_flutter/chat_room/chat_room.dart';

import 'package:go_router/go_router.dart';

// class ChatDetail extends StatefulWidget {

//   @override
//   State<ChatDetail> createState() => _ChatState();
// }

class ChatDetail extends StatelessWidget {
  final String name;
  final String chatId;
  final messageCtrl = TextEditingController();
  ChatDetail(this.name, this.chatId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          name,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 2.0,
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (_, authState) {
              if (!(authState is LoginSuccessful)) {
                return Text("You are not Logged in!");
              }
              return BlocConsumer<MessageBloc, MessageState>(
                  listener: (_, state) {
                if (state is MessageSentSuccessful) {
                  final messageBloc = BlocProvider.of<MessageBloc>(context);
                  messageBloc.add(LoadMessages(this.chatId));
                }
              }, builder: (context, state) {
                if (state is MessageLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SendingMessage) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MessagesLoadingFailure) {
                  return Center(
                    child: Text("Couldn't load messages"),
                  );
                }
                if (state is MessageSendingFailure) {
                  return Center(
                    child: Text("Couldn't Send message."),
                  );
                }
                if (state is MessagesLoadSuccess) {
                  return state.messages.isNotEmpty
                      ? ListView.builder(
                          reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (_, index) => Align(
                              alignment: authState.userId.id ==
                                      state.messages[index].owner
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  color: authState.userId.id ==
                                          state.messages[index].owner
                                      ? Colors.indigoAccent
                                      : Colors.black12,
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.rectangle,
                                  //   borderRadius: BorderRadius.circular(50),),
                                  // decoration: BoxDecoration( borderRadius: BorderRadius.circular(50)),
                                  // decoration: BoxDecoration(borderRadius: BorderRadiusGeometry()),
                                  // color: Colors.black12/,
                                  padding: EdgeInsets.all(20),
                                  child: Text(state.messages[index].text))))
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
                return Text("Never Come Here");
              });
            },
          ),
        ),
        //message to be sent
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
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageCtrl,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Type message.........",
                          hintStyle:
                              TextStyle(color: Colors.black87, fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is! LoginSuccessful) {
                          return Text("You havent Logged in");
                        }
                        return BlocBuilder<MessageBloc, MessageState>(
                          builder: (context, messageState) {
                            if (messageState is MessagesLoadSuccess) {
                              return FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  final messageBloc =
                                      BlocProvider.of<MessageBloc>(context);
                                  messageBloc.add(
                                    CreateMessage(
                                      this.chatId,
                                      Message(
                                        text: messageCtrl.text,
                                        owner: state.userId.id!,
                                        chat: this.chatId,
                                        time: DateTime.now(),
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Color.fromARGB(255, 31, 97, 249),
                                  size: 20,
                                ),
                              );
                            }
                            return FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 31, 97, 249),
                                size: 20,
                              ),
                            );
                          },
                        );
                      },
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
