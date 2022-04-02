import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../app/app_string.dart';

class AppException implements Exception {
  final String prefix;
  final String message;

  AppException({this.prefix = '', this.message = ''});

  @override
  String toString() {
    if (kDebugMode) {
      Get.snackbar(AppString.alert, prefix);
    }
    return '$prefix$message';
  }
}

class TimeoutException extends AppException {
  TimeoutException([String message = ''])
      : super(
          prefix: 'Request Timeout: ',
          message: message,
        );
}

class FetchDataException extends AppException {
  FetchDataException([String message = ''])
      : super(
          prefix: 'Error During Communication: ',
          message: message,
        );
}

class ConnectionException extends AppException {
  ConnectionException([String message = ''])
      : super(
          prefix: 'Server Connection Failed: ',
          message: message,
        );
}

class BadRequestException extends AppException {
  BadRequestException([String message = ''])
      : super(
          prefix: 'Invalid Request: ',
          message: message,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String message = ''])
      : super(
          prefix: 'Unauthorised Request: ',
          message: message,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = ''])
      : super(
          prefix: 'Invalid Input: ',
          message: message,
        );
}
