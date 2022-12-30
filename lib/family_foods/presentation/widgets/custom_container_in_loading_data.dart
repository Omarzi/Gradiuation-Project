// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  final double? height, width;

  const Loading({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8.sp),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      ),
    );
  }
}
