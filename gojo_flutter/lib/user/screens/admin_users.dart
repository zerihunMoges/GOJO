import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

// class AdminUsers extends StatefulWidget {
//   const AdminUsers({Key? key}) : super(key: key);

//   @override
//   State<AdminUsers> createState() => _AdminUsersState();
//   _AdminUsersState extends State<AdminUsers>
// }
// final List<Map> _messages = [
//   {"name": "HENOK", "url": "assets/melancholy.png"},
//   {"name": "DAWIT", "url": "assets/melancholy.png"},
//   {"name": "KIDUS", "url": "assets/melancholy.png"},
//   {"name": "JIM", "url": "assets/melancholy.png"},
//   {"name": "ARROW", "url": "assets/melancholy.png"}
// ];

// List<Map> state.users = [];

// @override
// void initState() {
//   super.initState();
//   state.users = _messages;
// }

// void _search(String query) {
//   List<Map> _searched = _messages
//       .where((user) =>
//           user["name"].toString().toLowerCase().contains(query.toLowerCase()))
//       .toList();
//   setState(() {
//     state.users = _searched;
//   });
// }

class AdminUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserDeleting || state is UserUpdating) {
          return CircularProgressIndicator();
        }
        if (state is UserDeleteFailure ||
            state is UserUpdateFailure ||
            state is UserDeleteSuccess ||
            state is UserUpdateSuccess) {
          final message = state is UserDeleteFailure
              ? state.message
              : state is UserUpdateFailure
                  ? state.message
                  : state is UserDeleteSuccess
                      ? state.message
                      : state is UserUpdateSuccess
                          ? state.message
                          : "Message";
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(UserLoad());
                },
                child: Text("OK"),
              ),
            ],
          );
        }
        if (state is UserLoadingFailure) {
          print("failed");
          return Center(
            child: Text("Users Not found"),
          );
        }

        if (state is UserLoadSuccess) {
          return Column(
            children: [
              Expanded(
                child: state.users.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.users.length,
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
                                        backgroundImage:
                                            AssetImage("assets/melancholy.png"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.users[index].username,
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
                                      // IconButton(
                                      //   iconSize: 18,
                                      //   onPressed: () {},
                                      //   icon: Icon(
                                      //     Icons.edit,
                                      //     color: Colors.indigoAccent,
                                      //   ),
                                      // ),
                                      IconButton(
                                        iconSize: 18,
                                        onPressed: () {
                                          BlocProvider.of<UserBloc>(context)
                                              .add(UserDelete(
                                                  state.users[index]));
                                        },
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
                              "The User doesn't exist.",
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

        return Center(child: Text("Users Not found"));
      },
    );
  }
}
