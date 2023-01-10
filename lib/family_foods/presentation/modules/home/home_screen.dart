// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  String? token;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.8.h, horizontal: 6.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 6.2.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6.sp),
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1.sp),
                  right: BorderSide(color: Colors.grey[300]!, width: 1.sp),
                  left: BorderSide(color: Colors.grey[300]!, width: 1.sp),
                  top: BorderSide(color: Colors.grey[300]!, width: 1.sp),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 1.h),
              child: Row(
                children: [
                  ImageIcon(
                    const AssetImage(AppAssets.searchIconinDetailsScreenPng),
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Search on product',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13.6.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        // children: [
        //   Text(
        //     'Welcome ${MyCache.getString(key: MyCacheKeys.myUserName).toString()}',
        //     style: TextStyle(fontSize: 18.sp, color: AppColors.blackColor),
        //   ),
        //   SizedBox(height: 5.h),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: const [
        //       CustomContainerInTopInHomeScreen(
        //         imagePath: AppAssets.contactIconInHomePng,
        //         title: 'Contact Us',
        //       ),
        //       CustomContainerInTopInHomeScreen(
        //         imagePath: AppAssets.profileIconInHomePng,
        //         title: 'Profile',
        //       ),
        //       CustomContainerInTopInHomeScreen(
        //         imagePath: AppAssets.yourOrdersIconInHomePng,
        //         title: 'Your Orders',
        //       ),
        //       CustomContainerInTopInHomeScreen(
        //         imagePath: AppAssets.debtIconInHomePng,
        //         title: 'Dept',
        //       ),
        //     ],
        //   ),
        //   SizedBox(height: 10.h),
        //   SizedBox(
        //     height: 20.h,
        //     child: Card(
        //       elevation: 10.sp,
        //       color: AppColors.grey2ColorPlayed,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(50.sp),
        //         ),
        //       ),
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.symmetric(
        //               horizontal: 6.w,
        //               vertical: 2.h,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   'All Products Are 20% Off This ',
        //                   textAlign: TextAlign.justify,
        //                   style: TextStyle(
        //                     fontSize: 15.sp,
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //                 SizedBox(height: 1.h),
        //                 Text(
        //                   'Month !!!!!!!',
        //                   textAlign: TextAlign.justify,
        //                   style: TextStyle(
        //                     fontSize: 15.sp,
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           SizedBox(height: 1.2.h),
        //           Container(
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                 color: AppColors.primaryColor,
        //                 width: 0.5.w,
        //               ),
        //               borderRadius: BorderRadius.circular(50.sp),
        //             ),
        //             child: Image.asset(AppAssets.getAllProductsIconInHomePng),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(height: 10.h),
        //   Container(
        //     height: 10.h,
        //     width: 78.w,
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 6.w,
        //       vertical: 2.h,
        //     ),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20.sp),
        //       gradient: LinearGradient(
        //         colors: [
        //           Color.fromARGB(255, 12, 204, 140),
        //           AppColors.primaryColor,
        //           AppColors.primaryColorLight,
        //           Color.fromARGB(255, 88, 236, 194),
        //           Color.fromARGB(255, 12, 204, 140),
        //         ],
        //       ),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset(AppAssets.contactsUsIconInHomePng),
        //         SizedBox(width: 4.w),
        //         Text(
        //           'Your Points : 1560',
        //           style: TextStyle(
        //             fontSize: 16.sp,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
