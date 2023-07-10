import 'dart:convert';

import 'package:bot_flut/api/api_helper.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../model/user.dart';
import '../api_settings.dart';

class ApiSearchController with ApiHelper {
  Future<ApiResponse<User>> search({
    required String name,
  }) async {
    Uri url = Uri.parse(ApiSettings.search);
    var response = await http.post(url, body: {"name": name}, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['user'] as List;
        List<User> user = jsonArray.map<User>((e) => User.fromJson(e)).toList();
        return ApiResponse.listData(
            message: 'Successfully Searched', status: true, data: user);
      } else {
        String message = response.statusCode == 400
            ? jsonResponse['errors'][0]
            : jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return getGenericErrorServer<User>();
  }
}
