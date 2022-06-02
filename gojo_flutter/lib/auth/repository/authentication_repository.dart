import 'dart:convert';

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
          _apiResponse.data = User.fromJson(json.decode(response.body));
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
      _apiResponse.error = "could not connect";
    }

    return _apiResponse;
  }
}
