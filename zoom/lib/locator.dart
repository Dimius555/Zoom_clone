import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom/data/data_sources/local/app_storage.dart';
import 'package:zoom/data/data_sources/remote/auth_api.dart';
import 'package:zoom/data/data_sources/remote/client_api.dart';
import 'package:zoom/data/interfaces/auth_repository.dart';
import 'package:zoom/data/interfaces/meeting_repository.dart';
import 'package:zoom/data/interfaces/user_repository.dart';
import 'package:zoom/domain/repositories_impl/auth_repository_impl.dart';
import 'package:zoom/domain/repositories_impl/meeting_repository_impl.dart';
import 'package:zoom/domain/repositories_impl/user_repository_impl.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());
  sl.registerLazySingleton<AppStorage>(() => AppStorage(preferences: sl()));

  sl.registerLazySingleton<AuthAPI>(() => AuthAPI(appStorage: sl()));
  sl.registerLazySingleton<ClientAPI>(() => ClientAPI(appStorage: sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(api: sl()));
  sl.registerLazySingleton<MeetingRepository>(() => MeetingRepositoryImpl(api: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(api: sl()));
}
