// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class DefaultAppBarInAllScreens extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DefaultAppBarInAllScreens({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Image.asset(AppAssets.drawerIconPng),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
      title: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'FAMILY ',
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            TextSpan(
              text: 'F',
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            TextSpan(
              text: 'OO',
              style: TextStyle(
                color: Color(0xFFE8C071),
              ),
            ),
            TextSpan(
              text: 'DS',
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppAssets.searchIconinDetailsScreenPng,
            width: 6.w,
          ),
        ),
      ],
    );
  }
}
