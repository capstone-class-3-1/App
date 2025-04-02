import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.expandedHeight = 60.0,
    this.floating = true,
    this.pinned = true,
    this.snap = true,
    this.automaticallyImplyLeading = true,
    this.actions = const [],
  });

  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final List<Widget> actions; // 아이콘 리스트
  final bool automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.secondaryColor,
      expandedHeight: expandedHeight,
      floating: floating,
      pinned: pinned,
      snap: snap,
      actions: actions,
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
                      : ((settings.currentExtent - settings.minExtent) /
                              (settings.maxExtent - settings.minExtent))
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
        preferredSize: Size.fromHeight(0),
        child: SizedBox(),
      ),
    );
  }
}
