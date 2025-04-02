import 'package:flutter/material.dart';
import 'package:gitmago/features/auth/presentation/widgets/login_form.dart';
import 'package:gitmago/features/auth/presentation/widgets/auth_button.dart';
import 'package:gitmago/providers/navigation_provider.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:gitmago/features/auth/data/repositories/auth_repository.dart';
import 'package:gitmago/features/auth/data/models/login_request.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> _handleLogin() async {
    Provider.of<NavigationProvider>(
      context,
      listen: false,
    ).setRoute('/main', context);

    final request = LoginRequest(
      username: emailController.text,
      password: passwordController.text,
    );

    final success = await _authRepository.login(request);

    if (success) {
      Provider.of<NavigationProvider>(
        context,
        listen: false,
      ).setRoute('/main', context);
    } else {
      print('로그인 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "GIT",
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: "MAGO",
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "개발 실력을 한 단계 업그레이드",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor2,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  // color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: '이메일',
                          controller: emailController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: '비밀번호',
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 20),
                        AuthButton(text: '로그인', onPressed: _handleLogin),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "아이디 찾기 | 비밀번호 찾기",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.textColorOpacity,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "간편 로그인",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColorOpacity,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.textColorOpacity,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/github_logo.png',
                                scale: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'GitHub로 로그인',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "회원이 아니신가요?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColorOpacity,
                              ),
                            ),
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "회원가입하러 가기",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColorOpacity,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: const SizedBox(height: 50),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
