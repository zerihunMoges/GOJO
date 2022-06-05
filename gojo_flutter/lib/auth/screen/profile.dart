import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../data_provider/data_provider.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

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

  final authBloc = AuthBloc(AuthenticationRepo(AuthenticationRemote()));
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
    // user.name = "Hola MOther Fucking";
    // user.last_name = "Puta";
    // user.email = "leavemealone@gmail.com";
    // user.username = "chrisbrezzy";
    // user.id = 2.toString();
    emailCtrl.text = user.email;
    firstCtrl.text = user.name;
    lastCtrl.text = user.last_name;
    usernameCtrl.text = user.username;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            BlocProvider(
              create: (_) => authBloc,
              child: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                if (state is UserUpdating) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is UserUpdateFailure) {
                  return AlertDialog(
                    content:
                        Text("Couldn't Update User, Redirect to Login Page"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.go("/");
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                }
                if (state is UserUpdateSuccess) {
                  return AlertDialog(
                    content: Text(
                        "User Updating Succesfully, Redirect to Login Page"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.go("/");
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                }
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
                                    : Image.asset("assets/melancholy.png")
                                        .image,
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
                              hintText: "${user.name}",
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
                              hintText: "${user.last_name}",
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
                                  authBloc.add(UserUpdate(OtherUser(
                                      email: emailCtrl.text,
                                      name: firstCtrl.text,
                                      last_name: lastCtrl.text,
                                      username: usernameCtrl.text,
                                      id: user.id!)));
                                }
                              },
                              child: state is UserUpdating
                                  ? CircularProgressIndicator()
                                  : state is UserUpdateFailure
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
