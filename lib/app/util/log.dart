import 'package:flutter/foundation.dart';

void appLog(String value) {
  if (kDebugMode) {
    print(value);
  }
}
