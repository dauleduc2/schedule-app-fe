import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart' show ChangeNotifier;

class ApiProvider extends ChangeNotifier {
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
    notifyListeners();
  }

  String getErrorByField(String field, String message) {
    return errorDetails[field] = message;
  }
}
