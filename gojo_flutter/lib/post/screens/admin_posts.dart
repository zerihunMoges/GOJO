import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/post/bloc/bloc.dart';

// class AdminPost extends StatefulWidget {
//   const AdminPost({Key? key}) : super(key: key);

//   @override
//   State<AdminPost> createState() => _AdminPostState();
//   class _AdminPostState extends State<AdminPost>
// }

class AdminPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostDeleting) {
          return CircularProgressIndicator();
        }
        if (state is PostDeleteFailure) {
          return AlertDialog(
            content: Text("Couldn't delete post"),
            actions: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<PostBloc>(context).add(PostLoad());
                },
                child: Text("OK"),
              ),
            ],
          );
        }
        if (state is PostDeleteSuccess) {
          return AlertDialog(
            content: Text("Post Deleted Succesfully"),
            actions: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<PostBloc>(context).add(PostLoad());
                },
                child: Text("OK"),
              ),
            ],
          );
        }
        if (state is PostLoadingFailure) {
          return Center(
            child: Text("Posts Not found"),
          );
        }
        if (state is PostLoadSuccess) {
          return Column(
            children: [
              Expanded(
                child: state.posts.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
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
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "http://127.0.0.1:8000${state.posts[index].photo}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.posts[index].title,
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
                                                  state.posts[index].location,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            iconSize: 18,
                                            onPressed: () {
                                              BlocProvider.of<PostBloc>(context)
                                                  .add(PostDelete(
                                                      state.posts[index].id));
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
                              ),
                              const Divider(
                                thickness: 0.1,
                                indent: 20,
                                endIndent: 20,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
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
        return Center(
          child: Text("Some sort of Unknow Error Has occured"),
        );
      },
    );
  }
}
