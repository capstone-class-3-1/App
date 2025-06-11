import '../entities/user.dart';
import '../entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthResult> login({required String email, required String password});

  Future<AuthResult> register({
    required String email,
    required String password,
    required String name,
  });

  Future<AuthResult> loginWithGitHub();

  Future<void> logout();

  Future<AuthToken?> refreshToken();

  Future<User?> getCurrentUser();

  Future<bool> isLoggedIn();

  Stream<User?> get userStream;
}

class AuthResult {
  final User? user;
  final AuthToken? token;
  final String? error;
  final bool isSuccess;

  const AuthResult({
    this.user,
    this.token,
    this.error,
    required this.isSuccess,
  });

  factory AuthResult.success({required User user, required AuthToken token}) {
    return AuthResult(user: user, token: token, isSuccess: true);
  }

  factory AuthResult.failure(String error) {
    return AuthResult(error: error, isSuccess: false);
  }
}
