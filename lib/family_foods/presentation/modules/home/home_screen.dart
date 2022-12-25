// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/custom_container_in_top_in_home_screen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  String? token;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(vertical: 2.8.h, horizontal: 4.w),
      child: Column(
        children: [
          Text(
            'Welcome Mr.${MyCache.getString(key: MyCacheKeys.myUserName).toString()}',
            style: TextStyle(fontSize: 18.sp, color: AppColors.blackColor),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomContainerInTopInHomeScreen(
                imagePath: AppAssets.contactIconInHomePng,
                title: 'Contact Us',
              ),
              CustomContainerInTopInHomeScreen(
                imagePath: AppAssets.profileIconInHomePng,
                title: 'Profile',
              ),
              CustomContainerInTopInHomeScreen(
                imagePath: AppAssets.yourOrdersIconInHomePng,
                title: 'Your Orders',
              ),
              CustomContainerInTopInHomeScreen(
                imagePath: AppAssets.debtIconInHomePng,
                title: 'Dept',
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 20.h,
            child: Card(
              elevation: 10.sp,
              color: AppColors.grey2ColorPlayed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.sp),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Products Are 20% Off This ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'Month !!!!!!!',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.2.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 0.5.w,
                      ),
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Image.asset(AppAssets.getAllProductsIconInHomePng),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 10.h,
            width: 78.w,
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 12, 204, 140),
                  AppColors.primaryColor,
                  AppColors.primaryColorLight,
                  Color.fromARGB(255, 88, 236, 194),
                  Color.fromARGB(255, 12, 204, 140),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.contactsUsIconInHomePng),
                SizedBox(width: 4.w),
                Text(
                  'Your Points : 1560',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
