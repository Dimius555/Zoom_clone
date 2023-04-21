import 'package:zoom/data/data_sources/remote/auth_api.dart';
import 'package:zoom/data/interfaces/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthAPI api;

  AuthRepositoryImpl({required this.api});

  @override
  bool checkAuthorisation() {
    return api.checkAuthorisation();
  }

  @override
  Future<void> signInWithGoogle() {
    return api.signInWithGoogle();
  }

  @override
  Future<void> signOut() {
    return api.signOut();
  }
}
