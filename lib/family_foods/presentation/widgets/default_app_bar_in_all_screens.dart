// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
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
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.blackColorPlayed,
              ),
            ),
            Positioned(
              top: -14,
              left: 8,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
