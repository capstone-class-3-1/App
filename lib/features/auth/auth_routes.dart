import 'package:flutter/material.dart';
import 'package:gitmago/features/auth/presentation/pages/login_page.dart';
import 'package:gitmago/features/auth/presentation/pages/register_page.dart';

class AuthRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
