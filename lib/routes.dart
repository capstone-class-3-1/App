import 'package:flutter/material.dart';
import 'package:gitmago/features/auth/presentation/pages/login_page.dart';
import 'package:gitmago/features/auth/presentation/pages/register_page.dart';
import 'package:gitmago/features/home/presentation/pages/home_page.dart';
import 'package:gitmago/features/main/main_page.dart';
import 'package:gitmago/features/splash/presentation/splash_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
        );
    }
  }
}
