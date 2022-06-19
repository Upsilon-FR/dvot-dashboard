class ApiResponse {
  final bool error;
  final String message;
  final List<dynamic> data;

  ApiResponse({required this.error, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(error: json["error"] as bool, message: json["message"] as String, data: json["data"] as List<dynamic>);
  }
}