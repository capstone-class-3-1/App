import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 탭 개수를 4개로 변경
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColors.secondaryColor,
                expandedHeight: 60.0, // 높이를 100에서 60으로 줄임
                floating: true,
                pinned: true, // 스크롤 시 AppBar가 고정되도록 변경
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
            child: Column(
              children: [
                Container(height: 100, color: AppColors.secondaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
