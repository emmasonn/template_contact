import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/core/exceptions/exception.dart';
import 'package:flutter_app/core/helpers/json_checker.dart';
import 'package:http/http.dart';

class ApiService<T> {
  JsonChecker jsonChecker;

  ApiService({
    required this.jsonChecker,
  });

  Future<T> executeApiService({
    required Response Function() callApi,
    required T Function(dynamic) mapResult,
  }) async {

    final response = callApi();
    if (await jsonChecker.isJson(response.body)) {
      final data = json.decode(response.body);
      if (data['response']['status'] == 'OK') {
        return mapResult(data);
      } else {
        return handleErrorCode(data['response']);
      }
    } else {
      throw const FormatException('Unknown error format');
    }
  }

  static handleErrorCode(
    dynamic data,
  ) {
    final code = data['status'];
    if (code == '') {
      throw ServerException(data['response']['code']);
    } else if (code == '') {
      throw CommonException(data['response']['code']);
    } else if (code == '') {
      throw CacheException(data['response']['code']);
    } else if (code == '') {
      throw TimeoutException(data['response']['code']);
    } else {
      throw const FormatException('Unknown error format');
    }
  }
}
