import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthResult> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      return AuthResult.failure('이메일을 입력해주세요.');
    }

    if (password.isEmpty) {
      return AuthResult.failure('비밀번호를 입력해주세요.');
    }

    if (!_isValidEmail(email)) {
      return AuthResult.failure('올바른 이메일 형식이 아닙니다.');
    }

    if (password.length < 6) {
      return AuthResult.failure('비밀번호는 6자 이상이어야 합니다.');
    }

    try {
      return await repository.login(email: email, password: password);
    } catch (e) {
      return AuthResult.failure('로그인에 실패했습니다: ${e.toString()}');
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}