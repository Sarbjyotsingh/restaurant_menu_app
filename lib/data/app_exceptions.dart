/// This is a custom exception class hierarchy that extends the base Exception class
/// It is designed to handle different types of exceptions that can occur during application runtime
/// AppException defines the message and prefix variables that will be used by the subclasses
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

/// FetchDataException handles errors that occur during network communication with the server
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication with Server');
}

/// BadRequestException handles errors that occur when an invalid request is sent
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

/// NotFoundException handles errors that occur when the requested resource is not found on the server
class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message, 'The server can not find the requested resource');
}

/// InternalServerException handles errors that occur when the server encounters an unexpected condition
class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, 'The server encountered an unexpected condition');
}
