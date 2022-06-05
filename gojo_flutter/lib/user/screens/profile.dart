import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/user/bloc/user_bloc.dart';
import 'package:gojo_flutter/user/bloc/user_event.dart';
import 'package:gojo_flutter/user/bloc/user_state.dart';
import 'package:gojo_flutter/user/dataprovider/user_data.dart';
import 'package:gojo_flutter/user/models/user.dart';
import 'package:gojo_flutter/user/repository/user_repository.dart';
import 'package:file_picker/file_picker.dart';

class Profile extends StatefulWidget {
  final user;
  Profile(@required this.user);
  @override
  State<Profile> createState() => _ProfileState(user);
}

class _ProfileState extends State<Profile> {
  final User user;
  _ProfileState(@required this.user);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final firstCtrl = TextEditingController();
  final lastCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();

  final userBloc = UserBloc(UserRepository(dataProvider: UserDataProvider()));
  PlatformFile? pickedFile;
  bool image_view = false;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
      image_view = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    user.firstname = "Hola MOther Fucking";
    user.lastname = "Puta";
    user.email = "leavemealone@gmail.com";
    user.username = "chrisbrezzy";
    user.id = 2;
    emailCtrl.text = user.email;
    firstCtrl.text = user.firstname;
    lastCtrl.text = user.lastname;
    usernameCtrl.text = user.username;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.lightBlue,
              )),
          title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            BlocProvider(
              create: (_) => userBloc,
              child: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
                return Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Stack(clipBehavior: Clip.none, children: [
                            Container(
                              child: CircleAvatar(
                                radius: 75,
                                backgroundImage: pickedFile != null
                                    ? Image.memory(
                                        pickedFile!.bytes!,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ).image
                                    : Image.asset("assets/food_1.jpeg").image,
                              ),
                            ),
                            Positioned(
                                height: 35,
                                width: 35,
                                bottom: 0,
                                right: 5,
                                child: RawMaterialButton(
                                  onPressed: selectFile,
                                  fillColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 19,
                                    color: Colors.grey.shade600,
                                  ),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2,
                                        color: Colors.grey.shade200,
                                        style: BorderStyle.solid),
                                  ),
                                ))
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.1,
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 50,
                          child: TextFormField(
                            controller: firstCtrl,
                            decoration: InputDecoration(
                              hintText: "${user.firstname}",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Last Name",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 50,
                          child: TextFormField(
                            controller: lastCtrl,
                            decoration: InputDecoration(
                              hintText: "${user.lastname}",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 50,
                          child: TextFormField(
                            controller: usernameCtrl,
                            decoration: InputDecoration(
                              hintText: "${user.username}",
                            ),
                            //   validator: (String? value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Your ';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 50,
                          child: TextFormField(
                            controller: emailCtrl,
                            decoration: InputDecoration(
                              hintText: "${user.email}",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState!.validate()) {
                                  userBloc.add(UserUpdate(User(
                                      email: emailCtrl.text,
                                      firstname: firstCtrl.text,
                                      lastname: lastCtrl.text,
                                      username: usernameCtrl.text,
                                      id: user.id)));
                                }
                              },
                              child: state is UserUpdating
                                  ? CircularProgressIndicator()
                                  : state is UserUpdateFailuer
                                      ? const Text('Retry')
                                      : Text('Submit')),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        )));
  }
}
