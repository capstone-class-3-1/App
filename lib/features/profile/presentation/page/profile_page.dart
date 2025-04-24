import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/widgets/appbar/custom_sliver_appbar.dart';
import 'package:gitmago/features/profile/presentation/page/setting_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomSliverAppBar(
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                          ),
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Icon(Icons.settings, color: AppColors.textColor2),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(width: 15),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [Container(color: AppColors.secondaryColor, height: 100)],
          ),
        ),
      ),
    );
  }
}
