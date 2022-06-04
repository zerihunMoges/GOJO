import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return Colors.blue;
    }

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 400,
              child: Image(
                image: AssetImage('assets/melancholy.png'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400,
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email"),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 6,
                                color: Colors.red[400],
                              )
                            ])),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: "enter your email please",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email not entered ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("password"),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 6,
                                color: Colors.red[400],
                              )
                            ])),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
                            child: Icon(Icons
                                .remove_red_eye), // myIcon is a 48px-wide widget.
                          ),
                          labelText: "password not entered ",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'Remeber me',
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: BlocConsumer<AuthBloc, AuthState>(
                          listenWhen: ((previous, current) {
                            return current is LoginSuccessful;
                          }),
                          listener: (_, AuthState state) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => Create_post()),
                            // );

                            context.go("/home");
                            // u should pass the state value id to the other page
                          },
                          builder: (_, AuthState state) {
                            Widget buttonChange = const Text("Log in");
                            if (state is LoginIn) {
                              buttonChange = const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }
                            if (state is LoginSuccessful) {
                              buttonChange = const Text("Login Successful");
                            }
                            if (state is LoginFailed) {
                              buttonChange = Text('${state.error}');
                            }

                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: state is LoginIn
                                  ? null
                                  : () {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('hold on please')),
                                        );
                                      }
                                      final authBloc =
                                          BlocProvider.of<AuthBloc>(context);
                                      authBloc.add(Login(
                                          email: emailController.text,
                                          pass: passwordController.text));
                                    },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        buttonChange,
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    )
                                  ]),
                            );
                          },
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {},
                        child: const Text('forgot password?'),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 12),
                            ),
                            onPressed: () {
                              context.go("/signup");
                            },
                            child: const Text('sign up'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
