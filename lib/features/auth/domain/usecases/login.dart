import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class Login {
  final AuthRepository repository;
  Login(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
