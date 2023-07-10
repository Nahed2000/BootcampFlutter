class ApiSettings {
  static const String _baseUrl = 'http://osamapro.online';
  static const String baseApiUrl = '$_baseUrl/api/';
  static const String register = '${baseApiUrl}register';
  static const String login = '${baseApiUrl}login';
  static const String search = '${baseApiUrl}search';
  static const String updateUserLocation = '${baseApiUrl}update/{id}';
  static const String updateUserFcm = '${baseApiUrl}fcm/{id}';
  static const String links = '${baseApiUrl}links/{id}';
  static const String follow = '${baseApiUrl}follow';
}
