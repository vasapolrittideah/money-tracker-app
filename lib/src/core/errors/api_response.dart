class ApiResponse<T> {
  const ApiResponse({this.data, this.error, required this.timestamp});

  final T? data;
  final ApiError? error;
  final DateTime timestamp;

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json)? fromJsonT) => ApiResponse(
    data: json['data'] != null && fromJsonT != null ? fromJsonT(json['data']) : null,
    error: json['error'] != null ? ApiError.fromJson(json['error'] as Map<String, dynamic>) : null,
    timestamp: DateTime.parse(json['timestamp'] as String),
  );

  bool get isSuccess => data != null && error == null;
  bool get isError => error != null;
}

class ApiError {
  const ApiError({required this.statusCode, required this.message, this.details = const []});

  final int statusCode;
  final String message;
  final List<ApiErrorDetail> details;

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    statusCode: json['status'] as int,
    message: json['message'] as String,
    details:
        (json['details'] as List<dynamic>?)?.map((e) => ApiErrorDetail.fromJson(e as Map<String, dynamic>)).toList() ??
        const [],
  );
}

class ApiErrorDetail {
  const ApiErrorDetail({required this.field, required this.message, this.value});

  final String field;
  final String message;
  final Object? value;

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) =>
      ApiErrorDetail(field: json['field'] as String, message: json['message'] as String, value: json['value']);
}
