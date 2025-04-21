import 'package:flutter/material.dart';
import 'package:gitmago/features/main/main_page.dart';

class HomeRoutes {
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Home Page - 404 Not Found')),
              ),
        );
    }
  }
}
