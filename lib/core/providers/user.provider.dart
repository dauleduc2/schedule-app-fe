import 'package:flutter/cupertino.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
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

  set setIsLogin(bool isLogin) {
    this.isLogin = isLogin;
    notifyListeners();
  }

  Future<User> getCurrentUser() async {
    var user = await AuthApi.getCurrentUser();

    return User(
        email: 'dauleduc2@gmail.com',
        id: '1',
        name: 'Duc Dauuu',
        password: '111',
        username: 'dauleduc2');
  }
}

final userProvider = UserProvider();
