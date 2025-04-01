import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class QAPage extends StatelessWidget {
  const QAPage({super.key});

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
