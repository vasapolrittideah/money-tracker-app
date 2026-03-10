/// Represents a generic API response that wraps either a successful payload [T]
/// or an [ApiError] returned by the server.
class ApiResponse<T> {
  const ApiResponse({this.data, this.error, required this.timestamp});

  /// The deserialized response payload, or `null` if the request failed.
  final T? data;

  /// The error returned by the server, or `null` if the request succeeded.
  final ApiError? error;

  /// The server-side timestamp of when the response was generated.
  final DateTime timestamp;

  /// Deserializes an [ApiResponse] from [json].
  ///
  /// [fromJsonT] is used to deserialize the nested [data] field into type [T].
  /// If [fromJsonT] is `null` or the `data` key is absent, [data] will be `null`.
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json)? fromJsonT) =>
      ApiResponse(
        data: json['data'] != null && fromJsonT != null ? fromJsonT(json['data'] as Map<String, dynamic>) : null,
        error: json['error'] != null ? ApiError.fromJson(json['error'] as Map<String, dynamic>) : null,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  /// Returns `true` when [data] is present and no [error] was returned.
  bool get isSuccess => data != null && error == null;

  /// Returns `true` when the server returned an [error].
  bool get isError => error != null;
}

/// Represents an error payload returned by the API, containing a status code,
/// a human-readable message, and optional field-level [details].
class ApiError {
  const ApiError({required this.statusCode, required this.message, this.details = const []});

  /// The HTTP status code associated with the error (e.g. 400, 404, 500).
  final int statusCode;

  /// A human-readable description of the error.
  final String message;

  /// Field-level validation errors, if any.
  final List<ApiErrorDetail> details;

  /// Deserializes an [ApiError] from [json].
  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    statusCode: json['status'] as int,
    message: json['message'] as String,
    details:
        (json['details'] as List<dynamic>?)?.map((e) => ApiErrorDetail.fromJson(e as Map<String, dynamic>)).toList() ??
        const [],
  );
}

/// Describes a single field-level validation error within an [ApiError].
class ApiErrorDetail {
  const ApiErrorDetail({required this.field, required this.message, this.value});

  /// The name of the field that failed validation.
  final String field;

  /// A description of why the field failed validation.
  final String message;

  /// The invalid value that was submitted, if provided by the server.
  final Object? value;

  /// Deserializes an [ApiErrorDetail] from [json].
  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) =>
      ApiErrorDetail(field: json['field'] as String, message: json['message'] as String, value: json['value']);
}
