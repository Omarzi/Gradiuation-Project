// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/layout/get_all_carts/get_all_carts.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_user_cart/get_all_user_cart_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/layout_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class DefaultAppBarInAllScreens extends StatelessWidget {
  final Widget title;
  final List<Widget> actions;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DefaultAppBarInAllScreens({super.key, required this.scaffoldKey, required this.title, required this.actions});

  GetAllUserCartCubit getAllUserCartCubit = GetAllUserCartCubit();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      // leading: Builder(
      //   builder: (context) => IconButton(
      //     icon: Image.asset(AppAssets.drawerIconPng),
      //     onPressed: () {
      //       if (scaffoldKey.currentState!.isDrawerOpen) {
      //         scaffoldKey.currentState!.closeDrawer();
      //       } else {
      //         scaffoldKey.currentState!.openDrawer();
      //       }
      //     },
      //     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //   ),
      // ),
      centerTitle: true,
      // title: const Text.rich(
      //   TextSpan(
      //     children: [
      //       TextSpan(
      //         text: 'FAMILY ',
      //         style: TextStyle(
      //           color: AppColors.blackColor,
      //         ),
      //       ),
      //       TextSpan(
      //         text: 'F',
      //         style: TextStyle(
      //           color: AppColors.blackColor,
      //         ),
      //       ),
      //       TextSpan(
      //         text: 'OO',
      //         style: TextStyle(
      //           color: Color(0xFFE8C071),
      //         ),
      //       ),
      //       TextSpan(
      //         text: 'DS',
      //         style: TextStyle(
      //           color: AppColors.blackColor,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      title: title,
      actions: actions,
        // Stack(
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.shopping_cart_outlined,
        //         color: AppColors.blackColorPlayed,
        //       ),
        //     ),
        //     Positioned(
        //       top: -14,
        //       left: 8,
        //       child: Center(
        //         child: Container(
        //           padding: const EdgeInsets.all(10),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(100),
        //           ),
        //           child: Text(
        //             // GetAllUserCartCubit
        //             // GetAllProductsCubit.get(context).products.length.toString(),
        //             '1',
        //             style: TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               color: AppColors.primaryColor,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
    );
  }
}
