import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(height: 100, color: AppColors.secondaryColor),
          // Add more widgets here
        ],
      ),
    );
  }
}
