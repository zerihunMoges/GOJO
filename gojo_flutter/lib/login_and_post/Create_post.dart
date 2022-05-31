import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Create_post extends StatefulWidget {
  const Create_post({Key? key}) : super(key: key);

  @override
  State<Create_post> createState() => _Create_postState();
}

class _Create_postState extends State<Create_post> {
  final _formKey = GlobalKey<FormState>();
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "new post",
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            
            children: [
              Expanded(
                  child: image_view? 
                  Image.file(
                    File(pickedFile!.path!),
                    width: double.infinity,
                    height:250,
                    fit: BoxFit.cover,
                  )
                  
                  : Icon(
                Icons.house_rounded,
                size: 200,
              )),
              ElevatedButton.icon(
                  onPressed: selectFile,
                  icon: Icon(Icons.upload),
                  label: image_view?Text("change image"): Text("upload image")),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                Text("House Type"),
                Icon(
                  Icons.star_rate_rounded,
                  size: 6,
                  color: Colors.red[400],
                )
              ]),
              SizedBox(
                height: 9,
              ),
              TextFormField(
                      decoration: InputDecoration(
                          labelText: "villa,appartment,...",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter House type";
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                Text("bed room number"),
                Icon(
                  Icons.star_rate_rounded,
                  size: 6,
                  color: Colors.red[400],
                )
              ]),
              SizedBox(
                height: 9,
              ),
              TextFormField(
                      decoration: InputDecoration(
                          labelText: "0,1,2,4....",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the number of bedrooms";
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                Text("size"),
                Icon(
                  Icons.star_rate_rounded,
                  size: 6,
                  color: Colors.red[400],
                )
              ]),
              SizedBox(
                height: 9,
              ),
              TextFormField(
                      decoration: InputDecoration(
                          labelText: "size of the room or the house",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the size of the house";
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                Text("little discriptions about the house"),
                Icon(
                  Icons.star_rate_rounded,
                  size: 6,
                  color: Colors.red[400],
                )
              ]),
              SizedBox(
                height: 9,
              ),
              TextFormField(
                      decoration: InputDecoration(
                          labelText: "....",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "we need a little discription of the house";
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                Text("House rent"),
                Icon(
                  Icons.star_rate_rounded,
                  size: 6,
                  color: Colors.red[400],
                )
              ]),
              SizedBox(
                height: 9,
              ),
             TextFormField(
                      decoration: InputDecoration(
                          labelText: "amount per month",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the house rent";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:15),
                    TextButton.icon(onPressed: (){
                      // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                    }, icon: Icon(Icons.save), label: Text("save")),
                    SizedBox(height: 15,)
            ],
          ),
        ));
  }
}
