abstract class AuthRepository {
  bool checkAuthorisation();
  Future<void> signInWithGoogle();
  Future<void> signOut();
}
