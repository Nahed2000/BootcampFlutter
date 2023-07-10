class Links {
  late int id;
  late String title;
  late String link;
  late String username;
  late int isActive;
  late int userId;
  late String createdAt;
  late String updatedAt;

  Links.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
