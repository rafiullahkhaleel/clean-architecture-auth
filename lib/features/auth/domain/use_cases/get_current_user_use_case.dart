import '../auth_repository.dart';
import '../user_entity.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.getCurrentUser();
  }
}