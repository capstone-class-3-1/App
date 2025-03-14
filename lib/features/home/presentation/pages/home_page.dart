import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/home/presentation/widgets/tab_bar_delegate.dart';

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
                    Text('홈'),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Icon(Icons.notifications),
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
