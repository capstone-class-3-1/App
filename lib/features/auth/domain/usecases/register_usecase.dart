import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<AuthResult> call({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
  }) async {
    if (email.isEmpty) {
      return AuthResult.failure('이메일을 입력해주세요.');
    }

    if (password.isEmpty) {
      return AuthResult.failure('비밀번호를 입력해주세요.');
    }

    if (confirmPassword.isEmpty) {
      return AuthResult.failure('비밀번호 확인을 입력해주세요.');
    }

    if (name.isEmpty) {
      return AuthResult.failure('이름을 입력해주세요.');
    }

    if (!_isValidEmail(email)) {
      return AuthResult.failure('올바른 이메일 형식이 아닙니다.');
    }

    if (password.length < 6) {
      return AuthResult.failure('비밀번호는 6자 이상이어야 합니다.');
    }

    if (password != confirmPassword) {
      return AuthResult.failure('비밀번호가 일치하지 않습니다.');
    }

    if (name.length < 2) {
      return AuthResult.failure('이름은 2자 이상이어야 합니다.');
    }

    try {
      return await repository.register(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {
      return AuthResult.failure('회원가입에 실패했습니다: ${e.toString()}');
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}