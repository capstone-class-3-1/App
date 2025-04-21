import 'package:flutter/material.dart';
import 'package:gitmago/features/auth/auth_routes.dart';
import 'package:gitmago/features/home/home_routes.dart';
import 'package:gitmago/features/splash/splash_routes.dart';
import 'package:gitmago/features/main/main_routes.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashRoutes.generateRoute(settings);
      case '/login':
      case '/register':
        return AuthRoutes.generateRoute(settings);
      case '/home':
        return HomeRoutes.generateRoute(settings);
      case '/main':
        return MainRoutes.generateRoute(settings);
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
        );
    }
  }
}
