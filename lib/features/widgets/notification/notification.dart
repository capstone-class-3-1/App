import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/notification/presentation/notification_page.dart';

class AlertNotification extends StatelessWidget {
  final bool hasAlert;
  final Function()? onTap;

  const AlertNotification({super.key, this.hasAlert = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap:
              onTap ??
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.notifications, color: AppColors.textColor2),
          ),
        ),
        if (hasAlert)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
