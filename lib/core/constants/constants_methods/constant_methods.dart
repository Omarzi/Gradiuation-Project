// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

// ------------ //

flutterToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0.sp,
  );
}

// ------------ //

// ------------ //

Widget showLoadingIndicator() {
  return Center(
    child: CircularProgressIndicator(color: AppColors.primaryColor),
  );
}

// ------------ //

// ------------ //

Widget buildNoInternetWidget() {
  return Center(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.transparentColor,
        image: DecorationImage(
          image: AssetImage(AppAssets.mainBackgroundPng),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),

          Icon(
            Icons.wifi_off_outlined,
            size: 50.sp,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 10.h),

          Text(
            "Can't connect .. check internet",
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),

          // SvgPicture.asset(AppAssets.noInternetSvg),
          SizedBox(height: 10.h),
          CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ],
      ),
    ),
  );
}

// ------------ //

// ------------ //

Route animatRoute(Widget myWidget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => myWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// ------------ //