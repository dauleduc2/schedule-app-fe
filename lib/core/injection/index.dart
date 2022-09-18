import 'package:get_it/get_it.dart' show GetIt;
import 'package:schedule_app_fe/core/providers/api.provider.dart';

final locator = GetIt.instance;

void configureDependencies() async {
  locator.registerFactory<ApiProvider>(() => ApiProvider());
}
