
class ApiResponseError {
  final String? message;

  const ApiResponseError({this.message});

  Map<String, dynamic> toMap() => {'message': message};

  factory ApiResponseError.fromMap(Map<String, dynamic> map) {
    return ApiResponseError(message: map['message'] as String);
  }
}
