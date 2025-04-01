import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // 예시로 10개의 게시글 표시
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            color: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 작성자 정보 행
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.bottomBarColor,
                        radius: 20,
                        child: Icon(Icons.person, color: AppColors.textColor2),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '사용자 ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor2,
                            ),
                          ),
                          Text(
                            '${DateTime.now().day - index}일 전',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textColorOpacity,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(Icons.more_vert, color: AppColors.textColorOpacity),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 게시글 제목
                  Text(
                    '게시글 제목 ${index + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 게시글 내용
                  Text(
                    '게시글 내용이 여기에 표시됩니다. 이것은 예시 텍스트입니다.',
                    style: TextStyle(color: AppColors.textColor2),
                  ),
                  const SizedBox(height: 16),
                  // 태그
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text(
                          '#Flutter',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor2,
                          ),
                        ),
                        backgroundColor: AppColors.bottomBarColor,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Chip(
                        label: Text(
                          '#개발',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor2,
                          ),
                        ),
                        backgroundColor: AppColors.bottomBarColor,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 좋아요, 댓글, 공유 버튼
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(
                        Icons.thumb_up_outlined,
                        '${10 + index}',
                      ),
                      _buildActionButton(
                        Icons.comment_outlined,
                        '${5 + index}',
                      ),
                      _buildActionButton(Icons.share_outlined, '공유'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textColorOpacity),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: AppColors.textColorOpacity)),
      ],
    );
  }
}
