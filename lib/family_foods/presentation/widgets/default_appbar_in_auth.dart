// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class DefaultAppBarInAuth extends StatelessWidget {
  const DefaultAppBarInAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 20.sp,
      ),
    );
  }
}
