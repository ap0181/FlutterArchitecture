import 'package:business_logic/models/response/ErrorResponse.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, "Invalid Input: ");
}

class ServerNotRespondingException extends AppException {
  ServerNotRespondingException([String? message])
      : super(message, "Invalid Input: ");
}

class UserBlockException extends AppException {
  UserBlockException([String? message])
      : super(message, "Invalid Input: ");
}

class RetryErrorException extends AppException {
  RetryErrorException([String? message]) : super(message, "Invalid Input: ");
}

class ApiFailedException extends AppException {
  final ErrorResponse errorResponse;

  ApiFailedException(this.errorResponse)
      : super(errorResponse, "Invalid Input: ");
}

class EmptyResponseException extends AppException {
  EmptyResponseException() : super("Invalid Input: ");
}
