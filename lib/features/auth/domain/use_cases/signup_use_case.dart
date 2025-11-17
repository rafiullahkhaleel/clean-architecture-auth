import '../auth_repository.dart';
import '../user_entity.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<UserEntity> call(String name, String email, String password) {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('All fields are required');
    }
    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }
    return repository.signup(name, email, password);
  }
}