import 'dart:convert';

import 'package:bot_flut/api/api_helper.dart';
import 'package:bot_flut/pref/pref_controller.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../api_settings.dart';

class ApiUpdateUserLocation with ApiHelper {
  Future<ApiResponse> updateUserLocation({
    required String lat,
    required String long,
  }) async {
    Uri url = Uri.parse(ApiSettings.updateUserLocation
        .replaceFirst('{id}', SharedPreferenceController().id.toString()));
    var response =
        await http.put(url, body: {"lat": lat, "long": long}, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonLat = jsonResponse['user']['lat'];
        var jsonLong = jsonResponse['user']['long'];
        return ApiResponse.listData(
          message: 'Successfully Updated',
          status: true,
          data: [jsonLat, jsonLong],
        );
      } else {
        String message = response.statusCode == 400
            ? jsonResponse['errors'][0]
            : jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return getGenericErrorServer();
  }

  Future<ApiResponse> updateUserFcm({
    required String fcm,
  }) async {
    Uri url = Uri.parse(ApiSettings.updateUserFcm
        .replaceFirst('{id}', SharedPreferenceController().id.toString()));
    var response = await http.put(url, body: {"fcm": fcm}, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse.listData(
          message: 'Successfully Updated',
          status: true,
          data: [jsonResponse['user']['fcm']],
        );
      } else {
        String message = response.statusCode == 400
            ? jsonResponse['errors'][0]
            : jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return getGenericErrorServer();
  }
}
