import 'package:flutter/material.dart';
import 'package:gitmago/features/community/widgets/tab_bar_delegate.dart';
import 'package:gitmago/theme/colors.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

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
                  const TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.only(left: 10.0),
                    labelColor: AppColors.textColor2,
                    unselectedLabelColor: AppColors.textColor2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColors.textColor2, // 선택된 탭 하단 표시 색상 변경
                    isScrollable: true, // 탭이 많을 때 스크롤 가능하도록 설정
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ), // 탭 텍스트 사이의 여백 줄임
                    tabs: [Tab(text: '추천'), Tab(text: '랭킹'), Tab(text: '모임')],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              // 추천 탭 내용
              Container(color: Colors.white),
              // 랭킹 탭 내용
              ListView.builder(
                itemCount: 20,
                itemBuilder:
                    (context, index) => ListTile(title: Text('랭킹 아이템 $index')),
              ),
              // 세일 탭 내용
              ListView.builder(
                itemCount: 20,
                itemBuilder:
                    (context, index) => ListTile(title: Text('세일 아이템 $index')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
