import 'package:zoom/data/data_sources/remote/client_api.dart';
import 'package:zoom/data/interfaces/user_repository.dart';
import 'package:zoom/domain/models/app_user.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientAPI api;

  UserRepositoryImpl({required this.api});

  @override
  Future<AppUser> fetchUser() {
    return api.fetchUser();
  }

  @override
  Future<void> removeUser() {
    // TODO: implement removeUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(AppUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
