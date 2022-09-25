import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/model/user.dart';

final defaultUser = User(
    email: 'dauleduc2@gmail.com',
    id: '1',
    name: 'Duc Dauuu',
    password: '111',
    username: 'dauleduc2');

class UserProvider extends ChangeNotifier {
  User currentUser = defaultUser;
  bool isLogin = false;
  final AuthApi _authApi;

  UserProvider(this._authApi);

  set setIsLogin(bool isLogin) {
    this.isLogin = isLogin;
    notifyListeners();
  }

  Future<User> getCurrentUser() async {
    var res = await _authApi.getCurrentUser();
    var resUser = json.decode(res.toString());
    var newUser = User(
        email: resUser['email'],
        id: resUser['id'],
        name: resUser['name'],
        password: resUser['password'],
        username: resUser['username']);

    currentUser = newUser;
    isLogin = true;
    notifyListeners();
    return newUser;
  }
}
