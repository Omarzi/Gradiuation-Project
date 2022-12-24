// ignore_for_file: depend_on_referenced_packages, must_be_immutable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  final String token;

  static const String routeName = 'splashScreen';

  SplashScreen({super.key, required this.token});

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.logoSplashScreenPng,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 7.0,
                    animationDuration: 2500,
                    percent: 1,
                    barRadius: const Radius.circular(50),
                    progressColor: AppColors.primaryColor,
                    onAnimationEnd: () {
                      if (token == null || token == "1") {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'checkScreen', (route) => false);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'homeScreen', (route) => false);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
