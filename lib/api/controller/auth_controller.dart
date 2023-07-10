import 'dart:convert';

import 'package:bot_flut/api/api_helper.dart';
import 'package:bot_flut/api/api_settings.dart';
import 'package:bot_flut/model/user.dart';
import 'package:bot_flut/pref/pref_controller.dart';
import 'package:http/http.dart' as http;
import '../../model/api_response.dart';

class ApiAuthController with ApiHelper {
  Future<ApiResponse> register({
    required String name,
    required String password,
    required String email,
  }) async {
    Uri url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
      "name": name,
      "password_confirmation": password,
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: response.statusCode == 201
            ? jsonResponse['message']
            : jsonResponse['errors']['email'][0],
        status: response.statusCode == 201 ? true : false,
      );
    } else {
      return errorServer;
    }
  }

  Future<ApiResponse> login(
      {required String email, required String password}) async {
    Uri url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonUser = jsonResponse['user'];
        String jsonToken = jsonResponse['token'];
        var user = User()
          ..name = jsonUser['name']
          ..email = jsonUser['email']
          ..token = jsonToken
          ..id = jsonUser['id'];
        SharedPreferenceController().save(user: user);
        return ApiResponse(message: 'Successfully login !', status: true);
      } else {
        return ApiResponse(message: jsonResponse['message'], status: false);
      }
    } else {
      return errorServer;
    }
  }
}
