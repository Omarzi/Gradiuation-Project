// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:sizer/sizer.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   AppAssets.checkBeforLoginPng,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.fill,
        // ),
        Scaffold(
          // backgroundColor: AppColors.transparentColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.mainLogoPng),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h),

                  // SizedBox(height: MediaQuery.of(context).size.height / 1.4),
                  DefaultButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      'loginScreen',
                    ),
                    size: Size(70.w, 6.8.h),
                    bgColor: AppColors.primaryColor,
                    text: 'Sign in',
                    textColor: AppColors.whiteColor,
                    fontSize: 13.sp,
                  ),
                  SizedBox(height: 3.h),
                  DefaultButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      'registerScreen',
                    ),
                    size: Size(70.w, 6.8.h),
                    bgColor: AppColors.greyColorPlayed,
                    text: 'Register A new employee',
                    textColor: AppColors.blackColor,
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
