import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: 50,
          height: 50,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
