abstract class AuthRepository {
  Future<void> login({
    required String email,
    required String password,
  }) async {}

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {}
}
