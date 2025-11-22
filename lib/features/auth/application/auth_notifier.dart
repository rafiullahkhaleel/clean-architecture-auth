import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../domain/entities/user_entity.dart';
import '../domain/usecases/sign_up.dart';
import '../domain/usecases/login.dart';
import '../domain/usecases/get_user.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/datasources/auth_remote_data_source.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(AuthRemoteDataSource()));

class AuthNotifier extends StateNotifier<UserEntity?> {
  final SignUp signUpUsecase;
  final Login loginUsecase;
  final GetUser getUserUsecase;

  AuthNotifier(this.signUpUsecase, this.loginUsecase, this.getUserUsecase) : super(null);

  Future<void> signup(String name, String email, String password) async {
    state = await signUpUsecase(name, email, password);
  }

  Future<void> login(String email, String password) async {
    state = await loginUsecase(email, password);
  }

  Future<void> loadUser() async {
    state = await getUserUsecase();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, UserEntity?>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return AuthNotifier(SignUp(repo), Login(repo), GetUser(repo));
});
