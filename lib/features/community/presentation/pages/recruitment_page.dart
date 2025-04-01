import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class RecruitmentPage extends StatelessWidget {
  const RecruitmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [Container(height: 100, color: AppColors.secondaryColor)],
      ),
    );
  }
}
