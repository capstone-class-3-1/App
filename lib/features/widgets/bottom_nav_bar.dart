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
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            child: SvgPicture.asset(
              currentIndex == 0
                  ? 'assets/icons/comment/comment-alt-solid.svg'
                  : 'assets/icons/comment/comment-alt.svg',
              width: 20,
              height: 20,
            ),
          ),
          label: '커뮤니티',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            child: SvgPicture.asset(
              currentIndex == 1
                  ? 'assets/icons/home/home-solid.svg'
                  : 'assets/icons/home/home.svg',
              width: 20,
              height: 20,
            ),
          ),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            child: SvgPicture.asset(
              currentIndex == 2
                  ? 'assets/icons/user/user-solid.svg'
                  : 'assets/icons/user/user.svg',
              width: 20,
              height: 20,
            ),
          ),
          label: '마이',
        ),
      ],
      onTap: onTap,
      selectedItemColor: AppColors.textColor,
      unselectedItemColor: AppColors.textColorOpacity,
      selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
