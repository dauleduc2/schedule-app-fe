import 'package:get_it/get_it.dart' show GetIt;
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/api/config.dart';
import 'package:schedule_app_fe/core/constants/store.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/util/route.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  // providers
  getIt.registerSingleton<ApiProvider>(ApiProvider());
  getIt.registerSingleton<UserProvider>(UserProvider());

  // api
  getIt.registerSingleton<AuthApi>(AuthApi());
  getIt.registerSingleton<ApiClient>(ApiClient());

  // constants
  getIt.registerSingleton<StoreKey>(StoreKey());

  // router
  getIt.registerSingleton<PageNavigator>(PageNavigator());
}
