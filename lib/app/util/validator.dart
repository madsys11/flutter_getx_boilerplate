import 'package:get/utils.dart';

final validNumeric = RegExp(r'^[0-9]+$');
final validAlphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
final validLowerAlphanumeric = RegExp(r'^[a-z0-9]+$');
final validBarcode = RegExp(r'^[0-9:]+$');

String? lowerAlphanumericValidator(value) {
  if (value == null || value.length == 0) {
    return 'Please enter your account.';
  }
  if (validLowerAlphanumeric.hasMatch(value) == false) {
    return 'Only lower case letters and numbers are allowed.';
  }
  return null;
}

String? emailValidator(value) {
  if (value == null || value.length == 0) {
    return 'Please enter your account.';
  }
  if (GetUtils.isEmail(value)) {
    return null;
  } else {
    return 'Please enter your email format.';
  }
}

String? passwordBalidator(value) {
  if (value == null || value.length == 0) {
    return 'Please enter your password.';
  }
  return null;
}
