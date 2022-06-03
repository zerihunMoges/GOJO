import 'package:jwt_decode/jwt_decode.dart';

class User {
  late String? id;
  late String username;
  late String name;
  late String last_name;
  late String email;
  late String access_token;
  late String refresh_token;

  User(
      {required this.id,
      required this.username,
      required this.name,
      required this.last_name,
      required this.email,
      required this.access_token,
      required this.refresh_token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
  }

  User.fromJWT(Map<String, dynamic> json) {
    Map<String, dynamic> userInfo = Jwt.parseJwt(json['access']);

    print("");
    print("the user is $userInfo");
    print("");

    id = userInfo['user_id'].toString();
    username = userInfo['username'];
    name = userInfo['first_name'];
    last_name = userInfo['last_name'];
    email = userInfo['email'];
    access_token = json['access'];
    refresh_token = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['lastLogin'] = this.last_name;
    data['email'] = this.email;

    return data;
  }
}
