import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:gitmago/features/widgets/appbar/custom_sliver_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[const CustomSliverAppBar()];
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
