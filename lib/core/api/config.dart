import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:schedule_app_fe/core/constants/store.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final _apiProvider = getIt<ApiProvider>();
  Dio http = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:4000/api',
    ),
  );

  ApiClient() {
    handleOnLoad();
  }

  handleOnLoad() async {
    http.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final prefs = await SharedPreferences.getInstance();
      // include headers
      if (prefs.containsKey(StoreKey.authToken)) {
        options.headers[StoreKey.authToken] =
            'Bearer ${prefs.getString(StoreKey.authToken)}';
      }

      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      if (e.response?.statusCode == 400) {
        var errorDetails =
            json.decode(e.response.toString()).cast<String, String>();
        _apiProvider.setErrorDetails(errorDetails);
      }
      return handler.next(json.decode(e.response.toString()));
    }));
  }
}

ApiClient httpClient = ApiClient();
