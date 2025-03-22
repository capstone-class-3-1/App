import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColors.secondaryColor,
                expandedHeight: 60.0,
                floating: true,
                pinned: true,
                snap: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        final FlexibleSpaceBarSettings? settings =
                            context
                                .dependOnInheritedWidgetOfExactType<
                                  FlexibleSpaceBarSettings
                                >();
                        final double opacity =
                            settings == null ||
                                    settings.currentExtent <= settings.minExtent
                                ? 0.0
                                : ((settings.currentExtent -
                                            settings.minExtent) /
                                        (settings.maxExtent -
                                            settings.minExtent))
                                    .clamp(0.0, 1.0);

                        return Opacity(
                          opacity: opacity,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "GIT",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "MAGO",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Icon(Icons.search, color: AppColors.textColor2),
                        SizedBox(width: 10),
                        Icon(Icons.notifications, color: AppColors.textColor2),
                      ],
                    ),
                  ],
                ),
                scrolledUnderElevation: 0,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0), // 탭바 위 공간을 10에서 0으로 줄임
                  child: SizedBox(),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.secondaryColor,
                            backgroundImage: const AssetImage(
                              'assets/images/logo-title.png',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "김진현",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "이슈해결왕 Lv.5",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textColorOpacity,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " • ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textColorOpacity,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // 칭호보기 기능 구현
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      "내 칭호보기 >",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textColorOpacity,
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.textColor2,
                          side: BorderSide(color: AppColors.textColorOpacity),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          minimumSize: Size(60, 20),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: Text(
                          "프로필 수정",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
