import 'package:flutter/widgets.dart';
import 'package:gojo_flutter/post/dataprovider/post_data.dart';
import 'package:gojo_flutter/post/models/post.dart';
import 'package:gojo_flutter/user/dataprovider/data_provider.dart';
import 'package:gojo_flutter/user/models/models.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<List<User>> getUsers() async {
    return await dataProvider.getUsers();
  }

  Future<User> getUser(int id) async {
    return await dataProvider.getUser(id);
  }

  Future<void> updateUser(User user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    await dataProvider.deleteUser(id);
  }
}
