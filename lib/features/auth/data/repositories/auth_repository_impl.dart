import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource data;
  AuthRepositoryImpl(this.data);

  @override
  Future<UserEntity> signUp(String name, String email, String password) => data.signUp(name, email, password);

  @override
  Future<UserEntity> login(String email, String password) => data.login(email, password);

  @override
  Future<UserEntity?> getCurrentUser() => data.getCurrentUser();
}
