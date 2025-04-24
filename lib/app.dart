import 'package:flutter/material.dart';
import 'package:gitmago/features/auth/presentation/pages/login_page.dart';
import 'package:gitmago/features/auth/presentation/pages/register_page.dart';
import 'package:gitmago/features/home/presentation/pages/home_page.dart';
import 'package:gitmago/features/main/main_page.dart';
import 'package:gitmago/features/splash/presentation/splash_page.dart';
import 'package:gitmago/routes.dart';
import 'package:provider/provider.dart';
import 'package:gitmago/theme/colors.dart';
import 'providers/navigation_provider.dart';

class GitmagoApp extends StatelessWidget {
  const GitmagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'SUITE',
            iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                highlightColor: Colors.transparent,
                overlayColor: Colors.transparent,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.textColor,
              unselectedItemColor: AppColors.textColorOpacity,
              selectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          title: 'GitMago',
          home: _getScreen(
            navigationProvider.currentRoute,
          ), // Provider에서 현재 화면을 가져옴
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }

  Widget _getScreen(String route) {
    switch (route) {
      case '/main':
        return MainPage();
      case '/login':
        return const LoginPage();
      case '/home':
        return const HomePage();
      case '/register':
        return const RegisterPage();
      default:
        return const SplashPage();
    }
  }
}
