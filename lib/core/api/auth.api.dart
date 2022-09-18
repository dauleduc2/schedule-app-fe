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

      if (response.statusCode == 200) return response;
    } catch (e) {
      return null;
    }
  }
}
