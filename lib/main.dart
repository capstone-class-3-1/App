import 'package:flutter/material.dart';
import 'package:gitmago/features/splash/presentation/pages/splash_page.dart';
import 'package:gitmago/core/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      home: SplashScreen(),
    );
  }
}
