import 'dart:convert';

import 'package:business_logic/models/response/ErrorResponse.dart';
import 'package:dio/dio.dart' as Dio;

class ParseErrorResponse {
  ErrorResponse parseApiErrorResponse(Dio.Response response, bool isError) {
    if (response.data is String) {
      return ErrorResponse.fromJson(jsonDecode(response.data));
    } else if (response.data is List<dynamic>) {
      return ErrorResponse.fromJson(response.data[0]);
    } else {
      return ErrorResponse.fromJson(response.data);
    }
  }

  ErrorResponse parseUserCartIdErrorResponse(
      Dio.Response response, bool isError) {
    /* final responseString =
        (response.data).map((x) => SignUpErrorResponse.fromJson(x)).toList();*/
    return ErrorResponse.fromJson(response.data);
  }

}
