import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gitmago/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.bottomBarColor,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              currentIndex == 0
                  ? 'assets/icons/comment-alt-solid.svg'
                  : 'assets/icons/comment-alt.svg',
              width: 24,
              height: 24,
            ),
          ),
          label: '커뮤니티',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              currentIndex == 1
                  ? 'assets/icons/home-solid.svg'
                  : 'assets/icons/home.svg',
              width: 24,
              height: 24,
            ),
          ),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              currentIndex == 2
                  ? 'assets/icons/user-solid.svg'
                  : 'assets/icons/user.svg',
              width: 24,
              height: 24,
            ),
          ),
          label: '마이',
        ),
      ],
      onTap: onTap,
      selectedItemColor: AppColors.textColor,
      unselectedItemColor: AppColors.textColorOpacity,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
