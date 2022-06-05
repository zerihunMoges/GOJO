import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import 'package:go_router/go_router.dart';

class NameFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null) ? "name not entered " : null;
  }
}

class LastNameFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null) ? "last name not entered " : null;
  }
}

class UserNameFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null) ? "username not entered " : null;
  }
}

class EmailFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null) ? "email not entered " : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null) ? "password not entered " : null;
  }
}

class ComfirmPasswordFieldValidator {
  static String? validate(String value) {
    return (value.isEmpty || value == null)
        ? "please make sure to write the same password "
        : null;
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.house_rounded,
                        size: 70,
                        color: Color.fromARGB(255, 3, 48, 88),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 42, 25, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "GOJO",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),

              // Image.network(
              //   'https://i.pinimg.com/originals/70/ff/46/70ff46c0fe8b2e15f87730dfd1a38a00.gif',
              //   width: 200,
              //   height: 100,
              // ),

              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              // phone number and entry field
              SizedBox(
                width: 280,
                height: 30,
                child: Text(
                  "first name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "name not entered ";
                    }
                    return null;
                  },
                ),
              ),
              // password and entry field
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                height: 30,
                child: Text(
                  "lastname",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "last name not entered ";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // confirm password and entry field
              SizedBox(
                width: 280,
                height: 25,
                child: Text(
                  "username",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "username not entered ";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                height: 25,
                child: Text(
                  "email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email not entered ";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                height: 25,
                child: Text(
                  "password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password not entered ";
                    }

                    return null;
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                height: 25,
                child: Text(
                  "confirm password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 260,
                child: TextFormField(
                  controller: confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 228, 227, 227),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (confirmpasswordController.text !=
                        passwordController.text) {
                      return " please make sure to write the same password ";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(
                height: 45,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: ((previous, current) {
                  return current is SigninSuccessful;
                }),
                listener: (_, AuthState state) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => Create_post()),
                  // );
                  context.go("/");
                  // u should pass the state value id to the other page
                },
                builder: (_, AuthState state) {
                  Widget buttonChange = const Text("sign up");
                  if (state is SigningIn) {
                    buttonChange = const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  if (state is SigninSuccessful) {
                    buttonChange = const Text("signin Successful");
                  }
                  if (state is SigninFailed) {
                    buttonChange = Text('sign in failed please try again');
                  }

                  return ButtonTheme(
                      minWidth: 110,
                      height: 37,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 3, 48, 88),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 17),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: state is LoginIn
                            ? null
                            : () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formkey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('hold on please')),
                                  );
                                }
                                final authBloc =
                                    BlocProvider.of<AuthBloc>(context);
                                authBloc.add(Signup(
                                    email: emailController.text,
                                    name: nameController.text,
                                    last_name: lastNameController.text,
                                    username: usernameController.text,
                                    password: passwordController.text));
                              },
                      ));
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
