import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp(String name, String email, String password);
  Future<UserEntity> login(String email, String password);
  Future<UserEntity?> getCurrentUser();
}
