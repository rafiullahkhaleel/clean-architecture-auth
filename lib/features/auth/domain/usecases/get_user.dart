import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class GetUser {
  final AuthRepository repository;
  GetUser(this.repository);

  Future<UserEntity?> call() => repository.getCurrentUser();
}
