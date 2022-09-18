import 'package:dio/dio.dart';
import 'package:schedule_app_fe/core/api/apiUtil.dart';

class ApiClient {
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
      apiUtil.setGlobalLoading = true;
      apiUtil.setErrorDetails(e.response);

      return handler.next(e); //continue
    }));
  }
}

ApiClient httpClient = ApiClient();
