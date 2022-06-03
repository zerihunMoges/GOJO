import 'dart:convert';

import 'package:gojo_flutter/auth/bloc/auth_state.dart';

import '../data_provider/data_provider.dart';
import '../model/model.dart';
import '../model/user_register.dart';
import '../utils/Api_response.dart';

class AuthenticationRepo {
  ApiResponse _apiResponse = new ApiResponse();
  ApiResponse _apiResponse2 = new ApiResponse();

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

  Future<ApiResponse> registerUser(String email, String name, String last_name,
      String username, String password) async {
    User_register userRegister = User_register(
        username: username,
        name: name,
        last_name: last_name,
        email: email,
        password: password);
    try {
      final response = await authProvider.registerUser(userRegister);
      if (response.statusCode != 201) {
        _apiResponse2.error = "failed to register";
      }
    } catch (err) {
      _apiResponse2.error = "failed to connect";
    }

    return _apiResponse2;
  }
}
