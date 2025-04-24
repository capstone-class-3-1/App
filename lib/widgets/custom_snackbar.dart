import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: AppColors.textColor2),
      ),
      backgroundColor: AppColors.secondaryColor,
      // behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
