import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        centerTitle: false,
        leadingWidth: 16,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textColor2,
            size: 18,
          ),
        ),
        title: Text(
          '알림',
          style: TextStyle(color: AppColors.textColor2, fontSize: 16),
        ),
      ),
      body: Container(child: Center(child: Text('알림이 없습니다.'))),
    );
  }
}
