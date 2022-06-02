class User {
  late String userId;
  late String username;
  late String name;
  late String lastLogin;
  late String email;

  User(
      {required this.userId,
      required this.username,
      required this.name,
      required this.lastLogin,
      required this.email});


  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    name = json['name'];
    lastLogin = json['lastLogin'];
    email = json['email'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['lastLogin'] = this.lastLogin;
    data['email'] = this.email;
    return data;
  }


}
