import 'package:bot_flut/model/user.dart';

class Follow {
  late int followingCount;
  late int followersCount;
  late List<User> following;
  late List<User> followers;

  Follow();
  Follow.fromJson(Map<String, dynamic> json) {
    followingCount = json['following_count'];
    followersCount = json['followers_count'];
    if (json['following'] != null) {
      json['following'].forEach((v) {
        following.add(User.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      json['followers'].forEach((v) {
        followers.add(User.fromJson(v));
      });
    }
  }
}
