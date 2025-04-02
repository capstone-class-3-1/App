import 'package:flutter/material.dart';
import 'package:gitmago/features/community/widgets/tab_bar_delegate.dart';
import 'package:gitmago/features/community/presentation/pages/post_page.dart';
import 'package:gitmago/features/community/presentation/pages/qa_page.dart';
import 'package:gitmago/features/community/presentation/pages/recruitment_page.dart';
import 'package:gitmago/features/community/presentation/pages/event_page.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/widgets/appbar/custom_sliver_appbar.dart';
import 'package:gitmago/features/widgets/notification/notification.dart';
import 'package:gitmago/features/search/presentation/search_page.dart';
import 'package:gitmago/features/widgets/drawer/common_drawer.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 탭 개수를 4개로 변경
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        endDrawer: CommonDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CustomSliverAppBar(
                actions: [
                  Row(
                    children: [
                      AlertNotification(),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(Icons.menu, color: AppColors.textColor2),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                ],
              ),
              SliverToBoxAdapter(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
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
              ),
              SliverPersistentHeader(
                delegate: TabBarDelegate(
                  TabBar(
                    dividerColor: Colors.transparent,
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
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.2), // 시작 위치를 위로 조정 (0,1 → 0,0.5)
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(0.0, 1.0, curve: Curves.easeOutBack),
                    ),
                  ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child:
                  _isMenuOpen
                      ? Column(
                        key: const ValueKey('menu_open'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FloatingActionButton.small(
                            heroTag: 'edit_button',
                            backgroundColor: AppColors.secondaryColor,
                            onPressed: () {
                              setState(() {
                                _isMenuOpen = false;
                              });
                            },
                            child: Icon(
                              Icons.edit,
                              color: AppColors.textColor2,
                            ),
                          ),
                          SizedBox(height: 10),
                          FloatingActionButton.small(
                            heroTag: 'qa_outlined_button',
                            backgroundColor: AppColors.secondaryColor,
                            onPressed: () {
                              setState(() {
                                _isMenuOpen = false;
                              });
                            },
                            child: Icon(
                              Icons.question_answer_outlined,
                              color: AppColors.textColor2,
                            ),
                          ),
                          SizedBox(height: 10),
                          FloatingActionButton.small(
                            heroTag: 'qa_button',
                            backgroundColor: AppColors.secondaryColor,
                            onPressed: () {
                              setState(() {
                                _isMenuOpen = false;
                              });
                            },
                            child: Icon(
                              Icons.question_answer,
                              color: AppColors.textColor2,
                            ),
                          ),
                          SizedBox(height: 10),
                          FloatingActionButton.small(
                            heroTag: 'group_add_button',
                            backgroundColor: AppColors.secondaryColor,
                            onPressed: () {
                              setState(() {
                                _isMenuOpen = false;
                              });
                            },
                            child: Icon(
                              Icons.group_add,
                              color: AppColors.textColor2,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                      : SizedBox.shrink(key: const ValueKey('menu_closed')),
            ),
            AnimatedRotation(
              turns: _isMenuOpen ? 0.125 : 0.250 * 2,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                backgroundColor: AppColors.secondaryColor,
                shape: CircleBorder(),
                onPressed: () {
                  setState(() {
                    _isMenuOpen = !_isMenuOpen;
                  });
                },
                child: Icon(
                  _isMenuOpen ? Icons.add : Icons.add,
                  size: 32,
                  color: AppColors.textColor2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
