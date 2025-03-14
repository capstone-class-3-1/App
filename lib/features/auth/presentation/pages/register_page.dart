import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  iconSize: 18,
                  color: AppColors.textColorOpacity,
                ),
                Text(
                  "로그인",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColorOpacity,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(child: Column(children: [Text('회원가입')])),
          ),
        ],
      ),
    );
  }
}
