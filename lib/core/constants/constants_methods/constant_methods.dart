// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/custom_container_in_loading_data.dart';
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

// ------------ //

Widget loading() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.2.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Loading(
              height: 18.h,
              width: 45.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Loading(width: 22.w),
                  SizedBox(height: 0.6.h),
                  const Loading(),
                  SizedBox(height: 0.6.h),
                  const Loading(),
                  SizedBox(height: 0.6.h),
                  Row(
                    children: [
                      const Expanded(child: Loading()),
                      SizedBox(width: 2.w),
                      const Expanded(child: Loading()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// ------------ //

// ------------ //



// ------------ //