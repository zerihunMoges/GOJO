import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/post/bloc/bloc.dart';
import 'package:gojo_flutter/post/dataprovider/post_data.dart';
import 'package:gojo_flutter/post/models/post.dart';
import 'package:gojo_flutter/post/repository/post_repository.dart';
import 'package:gojo_flutter/user/models/user.dart';
import 'package:go_router/go_router.dart';

class EditPost extends StatefulWidget {
  EditPost(@required this.post);
  Post post;

  @override
  State<EditPost> createState() => _EditPostState(post);
}

class _EditPostState extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();
  Post post;
  _EditPostState(@required this.post);

  PostBloc postBloc =
      PostBloc(PostRepository(dataProvider: PostDataProvider()));
  List<Uint8List> gallery = [];
  List<Uint8List> Bedroom = [];
  List<Uint8List> Kitchen = [];
  List<Uint8List> Bathroom = [];

  late TextEditingController titleCtrl =
      TextEditingController(text: post.title.toString());
  late TextEditingController locationCtrl =
      TextEditingController(text: post.location.toString());
  late TextEditingController priceCtrl =
      TextEditingController(text: post.price.toString());
  late TextEditingController frequencyCtrl =
      TextEditingController(text: post.payment_frequency.toString());
  late TextEditingController areaCtrl =
      TextEditingController(text: post.area.toString());
  late TextEditingController bedcountCtrl = TextEditingController();
  late TextEditingController bathcountCtrl = TextEditingController();
  late TextEditingController kitchencountCtrl = TextEditingController();

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

  Future addRoom(room) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      if (result.files.first.bytes != null) {
        room.add(result.files.first.bytes!);
      }
    });
  }

  String dropdownvalue = 'House';

  // List of items in our dropdown menu
  var items = [
    'Villa',
    'Appartment',
    'House',
    'Store',
    'Shop',
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List> roomsdata = {
      "BedRoom": [bedcountCtrl, Bedroom],
      "BathRoom": [bathcountCtrl, Bathroom],
      "Kitchen": [kitchencountCtrl, Kitchen]
    };

    return BlocProvider(
      create: (_) => postBloc,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 168, 168, 168),
            title: Text(
              "Edit ${post.title}",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Stack(children: [
                    Image.memory(
                      pickedFile != null ? pickedFile!.bytes! : post.photo,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Center(
                        child: IconButton(
                      onPressed: selectFile,
                      iconSize: 30,
                      icon: Icon(Icons.change_circle),
                    ))
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 10,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "House Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 3, color: Colors.blue)),
                      ),
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: titleCtrl,
                    decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field can not be null";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: frequencyCtrl,
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                              labelText: "Payment frequency in month",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "this field can not be null";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 20,
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: priceCtrl,
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                              labelText: "Amount per payment frequency",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter the amount";
                            }
                            return null;
                          },
                        ),
                      ),

                      // ListView.builder(
                      //   itemBuilder: (idx)

                      //   )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: areaCtrl,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                        labelText: "Area",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field can not be null";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: locationCtrl,
                    decoration: InputDecoration(
                        labelText: "Location",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field can not be null";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Text("Bedroom"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: TextFormField(
                            controller: bedcountCtrl,
                            keyboardType: TextInputType.numberWithOptions(),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                                labelText: "count",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "this field can not be null";
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                            tooltip: "Add Image",
                            onPressed: () {
                              addRoom(Bedroom);
                            },
                            icon: Icon(Icons.add_a_photo)),
                        SizedBox(width: 10),
                        Container(
                          height: 100,
                          width: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Bedroom.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      child: Image.memory(Bedroom[index]),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Text("Kithcen"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: TextFormField(
                            controller: kitchencountCtrl,
                            keyboardType: TextInputType.numberWithOptions(),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                                labelText: "count",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "this field can not be null";
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                            tooltip: "Add Image",
                            onPressed: () {
                              addRoom(Kitchen);
                            },
                            icon: Icon(Icons.add_a_photo)),
                        SizedBox(width: 10),
                        Container(
                          height: 100,
                          width: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Kitchen.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.memory(Kitchen[index]),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Text("BathRoom"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: TextFormField(
                            controller: bathcountCtrl,
                            keyboardType: TextInputType.numberWithOptions(),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                                labelText: "count",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "this field can not be null";
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                            tooltip: "Add Image",
                            onPressed: () {
                              addRoom(Bathroom);
                            },
                            icon: Icon(Icons.add_a_photo)),
                        SizedBox(width: 10),
                        Container(
                          height: 100,
                          width: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Bathroom.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      child: Image.memory(Bathroom[index]),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<PostBloc, PostState>(
                    listenWhen: (_, current) {
                      return current is PostCreateSuccess;
                    },
                    listener: (_, PostState state) {},
                    // buildWhen: (previous, current) {
                    //   return previous is Idle ||
                    //       current is Idle ||
                    //       current is LogingIn;
                    // },
                    builder: (_, PostState state) {
                      Widget buttonChild = Text("Update");
                      if (state is PostCreating) {
                        buttonChild = const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      if (state is PostLoadSuccess) {
                        buttonChild = Icon(Icons.done);
                      }

                      if (state is PostOperationFailure) {
                        buttonChild = const Text("Retry");
                      }

                      if (state is PostDeleteSuccess) {
                        buttonChild = const Text("Post Deleted");
                        context.pushNamed('/home');
                      }

                      return Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: Row(
                            children: [
                              TextButton(
                                autofocus: true,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    List<Room> rooms = [];
                                    roomsdata.forEach((key, value) {
                                      if (int.parse(roomsdata[key]![0].text) >
                                          0) {
                                        rooms.add(Room(
                                            photos: roomsdata[key]![1],
                                            type: key,
                                            count: roomsdata[key]![0].text));
                                      }
                                    });

                                    postBloc.add(PostUpdate(Post(
                                        id: post.id,
                                        title: titleCtrl.text,
                                        type: dropdownvalue,
                                        user: post.user,
                                        photo: pickedFile != null
                                            ? pickedFile!.bytes!
                                            : post.photo,
                                        price: priceCtrl.text,
                                        area: areaCtrl.text,
                                        rooms: rooms,
                                        payment_frequency: frequencyCtrl.text,
                                        location: locationCtrl.text)));
                                  }
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 60, 150)
                                            .withOpacity(0.7),
                                    elevation: 3,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                                child: buttonChild,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                autofocus: true,
                                onPressed: () {
                                  postBloc.add(PostDelete(post.id));
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 60, 150)
                                            .withOpacity(0.7),
                                    elevation: 3,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                                child: Text("Delete"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
