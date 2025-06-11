import 'package:flutter/material.dart';
import 'package:gitmago/core/theme/colors.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // TODO: Implement register logic with BLoC
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('회원가입이 완료되었습니다!'),
            backgroundColor: Colors.green,
          ),
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(context);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30),

                // Header
                _buildHeader(),

                const SizedBox(height: 20),

                // Register Form
                _buildRegisterForm(),

                const SizedBox(height: 32),

                // Register Button
                AuthButton(
                  text: '회원가입',
                  onPressed: _isLoading ? null : _handleRegister,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: 24),

                // Terms and Privacy
                _buildTermsText(),

                const SizedBox(height: 32),

                // Login Link
                _buildLoginLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          '개발자 커뮤니티에 합류하세요',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          '코드 리뷰와 개발 지식을 공유해보세요',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        AuthTextField(
          controller: _nameController,
          label: '이름',
          hint: '실명을 입력해주세요',
          prefixIcon: Icons.person_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '이름을 입력해주세요';
            }
            if (value.length < 2) {
              return '이름은 2자 이상이어야 합니다';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        AuthTextField(
          controller: _emailController,
          label: '이메일',
          hint: 'your.email@example.com',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '이메일을 입력해주세요';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return '올바른 이메일 형식이 아닙니다';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        AuthTextField(
          controller: _passwordController,
          label: '비밀번호',
          hint: '6자 이상 입력하세요',
          obscureText: _obscurePassword,
          prefixIcon: Icons.lock_outlined,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '비밀번호를 입력해주세요';
            }
            if (value.length < 6) {
              return '비밀번호는 6자 이상이어야 합니다';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        AuthTextField(
          controller: _confirmPasswordController,
          label: '비밀번호 확인',
          hint: '비밀번호를 다시 입력하세요',
          obscureText: _obscureConfirmPassword,
          prefixIcon: Icons.lock_outlined,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '비밀번호 확인을 입력해주세요';
            }
            if (value != _passwordController.text) {
              return '비밀번호가 일치하지 않습니다';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTermsText() {
    return Text(
      '회원가입을 진행하면 서비스 이용약관 및 개인정보 처리방침에 동의하는 것으로 간주됩니다.',
      style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.4),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '이미 계정이 있으신가요? ',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            '로그인',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
