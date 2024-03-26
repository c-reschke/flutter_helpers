import 'api_response_error.dart';

class ApiResponseBase {
  final dynamic data;

  final List<ApiResponseError>? errors;

  ApiResponseBase({this.data, this.errors});

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'errors': errors,
    };
  }

  factory ApiResponseBase.fromMap(Map<String, dynamic> map) {
    return ApiResponseBase(
      data: map['data'] as dynamic,
      errors: map['errors'] as List<ApiResponseError>,
    );
  }
}
