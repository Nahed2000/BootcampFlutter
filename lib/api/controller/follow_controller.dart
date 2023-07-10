// import 'dart:convert';
//
// import 'package:bot_flut/api/api_helper.dart';
// import 'package:bot_flut/model/links.dart';
// import 'package:http/http.dart' as http;
//
// import '../../model/api_response.dart';
// import '../../model/follow.dart';
// import '../api_settings.dart';
//
// class ApiFollowController with ApiHelper {
//   Future<ApiResponse<Follow>> indexFollow() async {
//     Uri url = Uri.parse(ApiSettings.follow);
//     var response = await http.get(url, headers: headers);
//     print(response.statusCode);
//     if (response.statusCode == 200 || response.statusCode == 401) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         var following = jsonResponse['following'] as List ;
//         Follow follow = Follow()
//           ..followersCount = jsonResponse['followers_count']
//           ..followingCount = jsonResponse['following_count']
//           ..following = following
//           ..followers = jsonResponse['followers'];
//         // List<Follow> follow =
//         //     jsonArray.map<Follow>((e) => Follow.fromJson(e)).toList();
//         return ApiResponse.listData(
//             message: 'Successfully Searched', status: true, data: [follow]);
//       } else {
//         String message = jsonResponse['message'];
//         return ApiResponse(message: message, status: false);
//       }
//     }
//     return getGenericErrorServer<Follow>();
//   }
// }
