import 'dart:convert';

import 'package:gojo_flutter/auth/bloc/auth_state.dart';

import '../data_provider/data_provider.dart';
import '../model/model.dart';
import '../utils/Api_response.dart';

class AuthenticationRepo {
  ApiResponse _apiResponse = new ApiResponse();

  AuthenticationRemote authProvider;
  AuthenticationRepo(this.authProvider);

  Future<ApiResponse> loginUser(String username, String password) async {
    try {
      final response = await authProvider.authenticateUser(username, password);

      switch (response.statusCode) {
        case 200:
          _apiResponse.data = User.fromJWT(json.decode(response.body));
          break;
        case 401:
          Map<String, dynamic> jsons = json.decode(response.body);
          _apiResponse.error = jsons['error'];
          break;
        default:
          Map<String, dynamic> jsons = json.decode(response.body);
          _apiResponse.error = jsons['error'];
          break;
      }
    } catch (error) {
      _apiResponse.error = "faild to  connect";
    }

    return _apiResponse;
  }

  Future<ApiResponse> registerUser(
      String username, String name, String last_name, String email) async {
    User_register userRegister = User_register(
        username: username, name: name, last_name: last_name, email: email);
    try {
      final response = await authProvider.registerUser(userRegister);
      if (response.statusCode != 200) {
        _apiResponse.error = "failed to register";
      }
    } catch (err) {
      _apiResponse.error = "failed to connect";
    }

    return _apiResponse;
  }
}
