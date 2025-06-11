import 'package:flutter/material.dart';
import 'package:gitmago/core/theme/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상단 헤더
                  _buildHeader(context),
                  SizedBox(height: 20),

                  // 빠른 액션 버튼들
                  _buildQuickActions(),
                  SizedBox(height: 24),

                  // 오늘의 목표 카드
                  _buildTodayGoals(),
                  SizedBox(height: 24),

                  // 최근 활동
                  _buildRecentActivities(),
                  SizedBox(height: 24),

                  // 진행 중인 코드 리뷰
                  _buildOngoingReviews(),
                  SizedBox(height: 24),

                  // 주간 통계
                  _buildWeeklyStats(),
                  SizedBox(height: 24),

                  // 트렌딩 리포지토리
                  _buildTrendingRepos(),
                  SizedBox(height: 24),

                  // 추천 개발자
                  _buildRecommendedDevelopers(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    String greeting = '안녕하세요';

    if (hour < 12) {
      greeting = '좋은 아침이에요';
    } else if (hour < 18) {
      greeting = '좋은 오후에요';
    } else {
      greeting = '좋은 저녁이에요';
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '김진현님! 🚀',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '전체 3위 • 상위 10%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://github.com/identicons/jinhyeon.png',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        SizedBox(width: 4),
                        Text(
                          '850',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '빠른 실행',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '더보기',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                '새 PR 작성',
                Icons.add_circle_outline,
                Colors.green,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                '코드 리뷰',
                Icons.rate_review,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                '이슈 등록',
                Icons.bug_report,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionCard(
                '분석 보기',
                Icons.analytics,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(String title, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTodayGoals() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.emoji_events, color: Colors.amber, size: 20),
              ),
              SizedBox(width: 12),
              Text(
                '오늘의 목표',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Spacer(),
              Text(
                '2/3 완료',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildGoalItem('코드 리뷰 3개 완료', true),
          _buildGoalItem('새로운 기능 PR 작성', true),
          _buildGoalItem('테스트 커버리지 80% 달성', false),
          SizedBox(height: 12),
          LinearProgressIndicator(
            value: 2 / 3,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalItem(String goal, bool completed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: completed ? Colors.green : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              completed ? Icons.check : Icons.radio_button_unchecked,
              color: Colors.white,
              size: 16,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              goal,
              style: TextStyle(
                fontSize: 14,
                color: completed ? Colors.grey[600] : Colors.grey[800],
                decoration: completed ? TextDecoration.lineThrough : null,
                fontWeight: completed ? FontWeight.normal : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingRepos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '트렌딩 저장소',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '더보기',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              final repos = [
                {
                  'name': 'flutter/flutter',
                  'description':
                      'Flutter는 하나의 코드베이스로 모바일, 웹, 데스크톱용 네이티브 컴파일 애플리케이션을 개발하는 UI 툴킷',
                  'language': 'Dart',
                  'stars': '165k',
                  'forks': '27.3k',
                  'color': Color(0xFF00D2FF),
                },
                {
                  'name': 'microsoft/vscode',
                  'description': 'Visual Studio Code - 개발자를 위한 무료 소스 코드 에디터',
                  'language': 'TypeScript',
                  'stars': '163k',
                  'forks': '28.9k',
                  'color': Color(0xFF3178C6),
                },
                {
                  'name': 'facebook/react',
                  'description':
                      '사용자 인터페이스를 만들기 위한 선언적이고 효율적이며 유연한 JavaScript 라이브러리',
                  'language': 'JavaScript',
                  'stars': '228k',
                  'forks': '46.7k',
                  'color': Color(0xFFF7DF1E),
                },
              ];

              return Container(
                width: 280,
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (repos[index]['color'] as Color).withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.folder,
                            color: repos[index]['color'] as Color,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            repos[index]['name'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      repos[index]['description'] as String,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: repos[index]['color'] as Color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          repos[index]['language'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              repos[index]['stars'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.fork_right,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            SizedBox(width: 4),
                            Text(
                              repos[index]['forks'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 추천 개발자 섹션
  Widget _buildRecommendedDevelopers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '추천 개발자',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '더보기',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              final developers = [
                {
                  'name': '이민수',
                  'role': 'Frontend Developer',
                  'company': 'Google',
                  'contributions': '1.2k',
                  'avatar': 'https://github.com/identicons/minsu.png',
                  'isFollowing': false,
                },
                {
                  'name': '박지영',
                  'role': 'Backend Engineer',
                  'company': 'Microsoft',
                  'contributions': '987',
                  'avatar': 'https://github.com/identicons/jiyoung.png',
                  'isFollowing': true,
                },
                {
                  'name': '김태현',
                  'role': 'DevOps Engineer',
                  'company': 'Amazon',
                  'contributions': '756',
                  'avatar': 'https://github.com/identicons/taehyun.png',
                  'isFollowing': false,
                },
                {
                  'name': '최하늘',
                  'role': 'Mobile Developer',
                  'company': 'Meta',
                  'contributions': '634',
                  'avatar': 'https://github.com/identicons/hanul.png',
                  'isFollowing': false,
                },
              ];

              return Container(
                width: 160,
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        developers[index]['avatar'] as String,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      developers[index]['name'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      developers[index]['role'] as String,
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${developers[index]['contributions'] as String} 기여',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 28,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (developers[index]['isFollowing'] as bool)
                                  ? Colors.grey[300]
                                  : AppColors.primaryColor,
                          foregroundColor:
                              (developers[index]['isFollowing'] as bool)
                                  ? Colors.grey[700]
                                  : Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          (developers[index]['isFollowing'] as bool)
                              ? '팔로잉'
                              : '팔로우',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '최근 활동',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '전체보기',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: List.generate(5, (index) {
              final activities = [
                {
                  'type': 'commit',
                  'title': 'feat: 대시보드 UI 개선',
                  'repo': 'gitmago/frontend',
                  'time': '10분 전',
                  'additions': '+45',
                  'deletions': '-12',
                },
                {
                  'type': 'review',
                  'title': 'API 성능 최적화 코드 리뷰',
                  'repo': 'gitmago/backend',
                  'time': '1시간 전',
                  'comments': '3개 댓글',
                  'status': 'approved',
                },
                {
                  'type': 'pr',
                  'title': 'fix: 로그인 에러 처리 개선',
                  'repo': 'gitmago/auth-service',
                  'time': '3시간 전',
                  'status': 'merged',
                  'reviews': '2개 승인',
                },
                {
                  'type': 'issue',
                  'title': '모바일 반응형 레이아웃 버그',
                  'repo': 'gitmago/frontend',
                  'time': '5시간 전',
                  'priority': 'high',
                  'status': 'resolved',
                },
                {
                  'type': 'commit',
                  'title': 'docs: README 업데이트',
                  'repo': 'gitmago/docs',
                  'time': '1일 전',
                  'additions': '+25',
                  'deletions': '-3',
                },
              ];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildActivityIcon(activities[index]['type']!),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activities[index]['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.grey[800],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.folder_outlined,
                                    size: 14,
                                    color: Colors.grey[500],
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    activities[index]['repo']!,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    activities[index]['time']!,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (activities[index]['type'] == 'commit') ...[
                      SizedBox(height: 8),
                      Row(
                        children: [
                          _buildChangesBadge(
                            '+${activities[index]['additions']!.substring(1)}',
                            Colors.green,
                          ),
                          SizedBox(width: 8),
                          _buildChangesBadge(
                            activities[index]['deletions']!,
                            Colors.red,
                          ),
                        ],
                      ),
                    ],
                    if (activities[index]['status'] != null) ...[
                      SizedBox(height: 8),
                      _buildStatusBadge(activities[index]['status']!),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityIcon(String type) {
    IconData icon;
    Color color;

    switch (type) {
      case 'commit':
        icon = Icons.commit;
        color = Colors.green;
        break;
      case 'review':
        icon = Icons.rate_review;
        color = Colors.blue;
        break;
      case 'pr':
        icon = Icons.merge_type;
        color = Colors.purple;
        break;
      case 'issue':
        icon = Icons.bug_report;
        color = Colors.orange;
        break;
      default:
        icon = Icons.circle;
        color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 16),
    );
  }

  Widget _buildChangesBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String displayText;

    switch (status) {
      case 'merged':
        color = Colors.purple;
        displayText = '병합됨';
        break;
      case 'approved':
        color = Colors.green;
        displayText = '승인됨';
        break;
      case 'resolved':
        color = Colors.blue;
        displayText = '해결됨';
        break;
      default:
        color = Colors.grey;
        displayText = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildOngoingReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '진행 중인 코드 리뷰',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.12),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: List.generate(2, (index) {
              final reviews = [
                {
                  'title': '[Feature] 대시보드 UI 개선',
                  'author': '이상혁',
                  'comments': 5,
                },
                {'title': '[Fix] 로그인 버그 수정', 'author': '박민수', 'comments': 3},
              ];
              return ListTile(
                title: Text(
                  '${reviews[index]["title"]}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('작성자: ${reviews[index]["author"]}'),
                trailing: Chip(
                  label: Text('${reviews[index]["comments"]} 댓글'),
                  backgroundColor: AppColors.primaryColor.withValues(
                    alpha: 0.1,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '주간 통계',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.12),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('커밋', '23', Icons.commit),
              _buildStatItem('PR', '7', Icons.merge_type),
              _buildStatItem('리뷰', '12', Icons.rate_review),
              _buildStatItem('이슈', '4', Icons.error_outline),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
