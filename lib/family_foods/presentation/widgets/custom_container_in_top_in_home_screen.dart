// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:sizer/sizer.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';

class CustomContainerInTopInHomeScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  const CustomContainerInTopInHomeScreen(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.sp),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 1.3.h),
              width: 15.5.w,
              height: 6.5.h,
              color: AppColors.primaryColorLight,
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            title,
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
