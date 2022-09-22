import 'dart:convert';

import 'package:schedule_app_fe/core/api/config.dart' show httpClient;

class AuthApi {
  static Future<dynamic> login(String username, String password) async {
    try {
      final response = await httpClient.http.post('/auth/login',
          data: json.encode({
            'username': username,
            'password': password,
          }));
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> getCurrentUser() async {
    try {
      final response = await httpClient.http.get('/users/me');
      return response;
    } catch (e) {
      return null;
    }
  }
}
