// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   File? image;
//   ImageProvider? imagep;
//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       print(image);
//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image = imageTemporary;
//         if (this.image != null)
//           this.imagep = FileImage(this.image!);
//         else this.imagep = AssetImage("assets/food_1.jpeg");
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Color.fromARGB(255, 255, 255, 255),
//           leading: IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.lightBlue,
//               )),
//           title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
//         ),
//         body: Container(
//             child: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             SizedBox(height: 15),
//             Center(
//               child: Stack(clipBehavior: Clip.none, children: [
//                 CircleAvatar(
//                   radius: 58,
//                   backgroundImage: imagep,
//                 ),
//                 Positioned(
//                     height: 35,
//                     width: 35,
//                     bottom: 0,
//                     right: -3,
//                     child: RawMaterialButton(
//                       onPressed: () {
//                         pickImage();
//                       },
//                       fillColor: Colors.white,
//                       child: Icon(
//                         Icons.camera_alt,
//                         size: 19,
//                         color: Colors.grey.shade600,
//                       ),
//                       shape: CircleBorder(
//                         side: BorderSide(
//                             width: 2,
//                             color: Colors.grey.shade200,
//                             style: BorderStyle.solid),
//                       ),
//                     ))
//               ]),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             const Divider(
//               thickness: 0.1,
//               indent: 20,
//               endIndent: 20,
//               color: Colors.black,
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             ProfileForm()
//           ],
//         )));
//   }
// }

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({Key? key}) : super(key: key);

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final emailCtrl = TextEditingController();
//   final firstCtrl = TextEditingController();
//   final lastCtrl = TextEditingController();

//   final usernameCtrl = TextEditingController();


//   @override
//   Widget build(BuildContext context) {

  
//     return Form(
//       key: _formKey,
//       child: Container(
//         padding: EdgeInsets.all(35),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Text(
//                 "Full Name",
//                 style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               height: 50,
//               child: TextFormField(
//                 controller: firstCtrl,
//                 decoration: InputDecoration(
//                   hintText: "First Name",
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your first name';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               height: 50,
//               child: TextFormField(
//                 controller: lastCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Last Name",
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your last name';
//                   }
//                   return null;
//                 },
//               ),
//             ),
           
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Text(
//                 "User Name",
//                 style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               height: 50,
//               child: TextFormField(
//                 controller: usernameCtrl,
//                 decoration: InputDecoration(
//                   hintText: "User Name",
//                 ),
//                 //   validator: (String? value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return 'Please enter Your ';
//                 //   }
//                 //   return null;
//                 // },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Text(
//                 "Email",
//                 style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               height: 50,
//               child: TextFormField(
//                 controller: emailCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Email",
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//             ),
            
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: EdgeInsets.all(5),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Validate will return true if the form is valid, or false if
//                   // the form is invalid.
//                   if (_formKey.currentState!.validate()) {
//                     // Process data.
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
