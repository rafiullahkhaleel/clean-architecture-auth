import 'package:clean_architecture_auth/features/auth/domain/auth_repository.dart';
import 'package:clean_architecture_auth/features/auth/domain/user_entity.dart';

import 'data_source/firebase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);
  @override
  Future<UserEntity> getCurrentUser() async {
    final userModel = await dataSource.getCurrentUser();
    return userModel.toEntity();
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await dataSource.login(email, password);
    return userModel.toEntity();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signup(String name, String email, String password) async {
    final userModel = await dataSource.signup(name, email, password);
    return userModel.toEntity();
  }
}
