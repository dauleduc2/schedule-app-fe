import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:schedule_app_fe/core/constants/store.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:schedule_app_fe/util/sharePreferenceHelper.dart';

class ApiClient {
  final ApiProvider _apiProvider;
  Dio http = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:4000/api',
    ),
  );

  ApiClient(this._apiProvider) {
    handleOnLoad();
  }

  handleOnLoad() async {
    http.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final SharedPreferenceHelper preferenceHelper =
          getIt<SharedPreferenceHelper>();

      // include headers
      if (preferenceHelper.instance.containsKey(StoreKey.authToken)) {
        options.headers[StoreKey.authToken] =
            'Bearer ${preferenceHelper.authToken}';
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
      return handler.next(e);
    }));
  }
}
