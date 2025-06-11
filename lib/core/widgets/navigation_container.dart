import 'package:flutter/material.dart';
import 'package:gitmago/features/analytics/presentation/pages/analytics_page.dart';
import 'package:gitmago/features/code_review/presentation/pages/code_review_page.dart';
import 'package:gitmago/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:gitmago/features/profile/presentation/pages/profile_page.dart';
import 'package:gitmago/core/theme/colors.dart';

class NavigationContainerScreen extends StatefulWidget {
  const NavigationContainerScreen({super.key});

  @override
  State<NavigationContainerScreen> createState() =>
      _NavigationContainerScreenState();
}

class _NavigationContainerScreenState extends State<NavigationContainerScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const AnalyticsScreen(),
    const CodeReviewPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(100),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.secondaryColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '대시보드'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: '분석'),
            BottomNavigationBarItem(icon: Icon(Icons.code), label: '코드리뷰'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          ],
        ),
      ),
    );
  }
}
