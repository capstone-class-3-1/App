import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(children: [Text('커뮤니티')]),
    );
  }
}
