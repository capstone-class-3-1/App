import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  String _currentRoute = '/';

  String get currentRoute => _currentRoute;

  void setRoute(String route, BuildContext context) {
    if (_currentRoute != route) {
      _currentRoute = route;
      Navigator.pushReplacementNamed(context, route); // 기존 화면을 대체하여 이동
      notifyListeners();
    }
  }
}
