import 'package:zoom/domain/models/app_user.dart';

abstract class UserRepository {
  Future<AppUser> fetchUser();
  Future<void> updateUser(AppUser user);
  Future<void> removeUser();
}
