import 'dart:convert';

import 'package:bot_flut/api/api_helper.dart';
import 'package:bot_flut/model/links.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../model/user.dart';
import '../api_settings.dart';

class ApiLinksController with ApiHelper {
  Future<ApiResponse<Links>> indexLinks() async {
    Uri url = Uri.parse(ApiSettings.links.replaceFirst('{id}', ''));
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['links'] as List;
        List<Links> link =
            jsonArray.map<Links>((e) => Links.fromJson(e)).toList();
        return ApiResponse.listData(
            message: 'Successfully Searched', status: true, data: link);
      } else {
        String message = jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return getGenericErrorServer<Links>();
  }

  Future<ApiResponse> addPost(
      {required String username,
      required String link,
      required double isActive}) async {
    Uri url = Uri.parse(ApiSettings.links.replaceFirst('{id}', ''));
    var response = await http.post(
      url,
      body: {"link": link, "isActive": isActive, "username": username},
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(message: 'Successfully Add Post', status: true);
      } else {
        String message = response.statusCode == 400
            ? jsonResponse['errors'][0]
            : jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return errorServer;
  }

  Future<ApiResponse> updatePost(
      {required String username,
      required String link,
      required String id,
      required String title,
      required String isActive}) async {
    Uri url = Uri.parse(ApiSettings.links.replaceFirst('{id}', id));
    var response = await http.put(
      url,
      body: {
        "link": link,
        "isActive": isActive,
        "username": username,
        'title': title,
      },
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(message: jsonResponse['message'], status: true);
      } else {
        String message = response.statusCode == 400
            ? jsonResponse['errors'][0]
            : jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return errorServer;
  }

  Future<ApiResponse> deletePost({required String id}) async {
    Uri url = Uri.parse(ApiSettings.links.replaceFirst('{id}', id));
    var response = await http.delete(
      url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(message: jsonResponse['message'], status: true);
      } else {
        String message = jsonResponse['message'];
        return ApiResponse(message: message, status: false);
      }
    }
    return errorServer;
  }
}
