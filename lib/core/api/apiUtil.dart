import 'dart:convert';

import 'package:dio/dio.dart';

class ApiUtil {
  bool isGlobalLoading = false;
  bool isLocalLoading = false;
  Map<String, String> errorDetails = {};
  bool isError = false;
  String? message;
  String? errorMessage;

  set setGlobalLoading(bool value) {
    isGlobalLoading = value;
  }

  set setLocalLoading(bool value) {
    isLocalLoading = value;
  }

  void setErrorDetails(Response<dynamic>? response) {
    if (response != null) {
      errorDetails = json.decode(response.toString()).cast<String, String>();
    }
  }

  String getErrorByField(String field) {
    return errorDetails[field] ?? '';
  }
}

final apiUtil = ApiUtil();
