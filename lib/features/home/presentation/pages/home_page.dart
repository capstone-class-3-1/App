import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/widgets/appbar/custom_sliver_appbar.dart';
import 'package:gitmago/features/notification/presentation/notification_page.dart';

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
              CustomSliverAppBar(
                actions: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationPage(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.textColor2,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Icon(Icons.menu, color: AppColors.textColor2),
                      ),
                    ],
                  ),
                ],
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
