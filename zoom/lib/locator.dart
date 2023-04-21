import 'package:get_it/get_it.dart';
import 'package:zoom/data/data_sources/remote/auth_api.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<AuthAPI>(() => AuthAPI());
}
