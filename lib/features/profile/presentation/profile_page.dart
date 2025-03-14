import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(children: [Text('마이'), Text('마이'), Text('마이')]),
    );
  }
}
