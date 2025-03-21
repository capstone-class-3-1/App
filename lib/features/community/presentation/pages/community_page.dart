import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitmago/features/community/widgets/tab_bar_delegate.dart';
import 'package:gitmago/features/community/presentation/pages/post_page.dart';
import 'package:gitmago/features/community/presentation/pages/qa_page.dart';
import 'package:gitmago/features/community/presentation/pages/recruitment_page.dart';
import 'package:gitmago/features/community/presentation/pages/event_page.dart';
import 'package:gitmago/theme/colors.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 탭 개수를 4개로 변경
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
                  ],
                ),
                scrolledUnderElevation: 0,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0), // 탭바 위 공간을 10에서 0으로 줄임
                  child: SizedBox(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.secondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.bottomBarColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '개발 실력을 업그레이드 (예, #Flutter)',
                              style: TextStyle(
                                color: AppColors.textColorOpacity,
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: AppColors.textColorOpacity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: TabBarDelegate(
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.only(left: 10.0),
                    labelColor: AppColors.textColor2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColors.textColor2,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ), // 탭 텍스트 사이의 여백 줄임
                    tabs: [
                      Tab(text: '게시글'),
                      Tab(text: 'Q&A'),
                      Tab(text: '모집'),
                      Tab(text: '행사'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [PostPage(), QAPage(), RecruitmentPage(), EventPage()],
          ),
        ),
      ),
    );
  }
}
