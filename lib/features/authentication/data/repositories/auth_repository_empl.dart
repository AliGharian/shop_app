import 'package:shop_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryEmpl implements AuthRepository {
  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    //todo: should replace with valid function
    await Future.delayed(Duration(seconds: 3));
    if (email == 'email@email.com' && password == 'Password007#')
      throw Exception('failed login!');
  }
}
