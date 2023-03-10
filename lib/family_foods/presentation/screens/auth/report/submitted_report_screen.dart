// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:sizer/sizer.dart';

class SubmittedReportScreen extends StatelessWidget {
  const SubmittedReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.transparentColor,
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Image.asset(AppAssets.workingLogoPng),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WORKING ON IT',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          DefaultButton(
            bgColor: AppColors.primaryColor,
            text: 'Back To Login Page',
            textColor: AppColors.whiteColor,
            fontSize: 13.sp,
            size: Size(72.w, 6.8.h),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                'loginScreen',
              );
            },
          ),
        ],
      ),
    );
  }
}
