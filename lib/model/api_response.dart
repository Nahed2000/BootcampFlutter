class ApiResponse<T> {
  final String message;
  final bool status;
  List<T>? data;

  ApiResponse({
    required this.message,
    required this.status,
  });

  ApiResponse.listData({
    required this.data,
    required this.message,
    required this.status,
  });
}
