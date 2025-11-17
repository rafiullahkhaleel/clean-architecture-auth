import 'package:clean_architecture_auth/features/auth/domain/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> signup(String name, String email, String password);
  Future<UserEntity> getCurrentUser();
  Future<void> logout();
}