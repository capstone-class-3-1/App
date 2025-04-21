import 'package:flutter/material.dart';
import 'package:gitmago/features/main/main_page.dart';

class MainRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Main Route Not Found')),
              ),
        );
    }
  }
}
