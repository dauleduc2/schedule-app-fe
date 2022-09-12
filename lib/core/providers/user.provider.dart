import 'package:flutter/cupertino.dart';
import 'package:schedule_app_fe/core/model/user.dart';

final defaultUser = User(
    email: 'dauleduc2@gmail.com',
    id: '1',
    name: 'Duc Dauuu',
    password: '111',
    username: 'dauleduc2');

class UserProvider extends ChangeNotifier {
  User _currentUser = defaultUser;
  bool isLogin = true;
}
