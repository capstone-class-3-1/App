import 'package:flutter/material.dart';
import 'package:gitmago/features/community/presentation/pages/community_page.dart';
import 'package:gitmago/features/profile/presentation/profile_page.dart';
import 'package:gitmago/features/widgets/bottom_nav_bar.dart';
import 'package:gitmago/features/home/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final List<Widget> _pages = [CommunityPage(), HomePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
