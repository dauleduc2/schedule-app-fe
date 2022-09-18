import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class ApiClient {
  final _apiProvider = locator.get<ApiProvider>();
  Dio http = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:4000/api',
    ),
  );

  ApiClient() {
    handleOnLoad();
  }

  handleOnLoad() async {
    http.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // Do something with response error
      _apiProvider.setGlobalLoading = true;
      _apiProvider.setErrorDetails(e.response);

      return handler.next(e); //continue
    }));
  }
}

ApiClient httpClient = ApiClient();
