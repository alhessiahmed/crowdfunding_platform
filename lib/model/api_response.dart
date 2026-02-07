class ApiResponse<T> {
  final String message;
  final bool success;
  final int? statusCode;
  final T? object;

  ApiResponse({
    required this.message,
    required this.success,
    this.statusCode,
    this.object,
  });

  // factory ApiResponse.fromJson(
  //   Map<String, dynamic> json, {
  //   required int statusCode,
  //   T Function(dynamic data)? parser,
  //   // T Function(Map<String, dynamic>)? parser,
  // }) {
  //   return ApiResponse<T>(
  //     success: statusCode >= 200 && statusCode < 300,
  //     statusCode: statusCode,
  //     message: json['message'] ?? 'Success',
  //     object: parser != null ? parser(json) : null,
  //   );
  // }
}
