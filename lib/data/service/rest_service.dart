import 'dart:convert';
import 'dart:io';

import '../../app/util/app_log.dart';
import 'package:http/http.dart' as http;

import 'exception.dart';
import 'service_response.dart';

class RestService {
  static const String host = 'http://jsonplaceholder.typicode.com';
  static const int timeout = 10;
  static final Map<String, String> baseHeaders = {
    'Content-Type': 'application/json'
  };
  static final Map<String, dynamic> baseBody = {};

  static Future<dynamic> request(String url, {Map<String, String>? headers}) {
    appLog('request.url: $url, header: $headers');
    try {
      return http
          .get(
        Uri.parse(url),
        headers: headers ?? baseHeaders,
      )
          .timeout(const Duration(seconds: timeout), onTimeout: () {
        throw TimeoutException('$timeout seconds');
      }).then((response) {
        final jsonData = ServiceResponse.toJson(response);
        // appLog('$url.response: $jsonData');
        return jsonData;
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  static Future<dynamic> requestPost(String url,
      {Map<String, String>? headers,
      required Map<String, dynamic> body}) async {
    appLog('requestPost.url: $url, header: $headers, body: $body');
    try {
      return http
          .post(
        Uri.parse(url),
        headers: headers ?? baseHeaders,
        body: json.encode(body),
      )
          .timeout(const Duration(seconds: timeout), onTimeout: () {
        throw TimeoutException('$timeout seconds');
      }).then((response) {
        final jsonData = ServiceResponse.toJson(response);
        // appLog('$url.response: $jsonData');
        return jsonData;
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}
