// ignore_for_file: must_be_immutable, depend_on_referenced_packages, avoid_print
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/family_foods/business_logic/layout/layout_cubit.dart';
import 'package:graduation_project/family_foods/presentation/modules/cart/cart_screen.dart';
import 'package:graduation_project/family_foods/presentation/modules/home/home_screen.dart';
import 'package:graduation_project/family_foods/presentation/modules/products/products_screen.dart';
import 'package:graduation_project/family_foods/presentation/modules/profile/profile_screen.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_app_bar_in_all_screens.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = 'layoutScreen';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  LayoutScreen({super.key});

  List<Widget> tabs = [
    HomeScreen(),
    const CartScreen(),
    const ProductScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit layoutCubit = LayoutCubit.get(context);
        return Stack(
          children: [
            Image.asset(
              AppAssets.mainBackgroundPng,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Scaffold(
              key: scaffoldKey,
              backgroundColor: AppColors.transparentColor,
              drawer: DefaultDrawer(),
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 7.h),
                child: DefaultAppBarInAllScreens(scaffoldKey: scaffoldKey),
              ),
              body: tabs[layoutCubit.currentIndex],
              bottomNavigationBar: FloatingNavbar(
                margin: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 0.h,
                ),
                onTap: (int value) {
                  print(layoutCubit.currentIndex);
                  layoutCubit.onTap(value);
                },
                fontSize: 11.sp,
                selectedBackgroundColor: AppColors.transparentColor,
                unselectedItemColor: AppColors.colorOfBottomNavBarUnSelected,
                selectedItemColor: AppColors.colorOfBottomNavBarSelected,
                borderRadius: 15.sp,
                currentIndex: layoutCubit.currentIndex,
                iconSize: 20.sp,
                backgroundColor: const Color(0xFFF5F8FA),
                items: [
                  FloatingNavbarItem(
                    icon: Iconsax.home_1,
                    title: 'Home',
                  ),
                  FloatingNavbarItem(
                    icon: Iconsax.category,
                    title: 'Products',
                  ),
                  FloatingNavbarItem(
                    icon: Iconsax.shopping_cart,
                    title: 'Cart',
                  ),
                  FloatingNavbarItem(
                    icon: Iconsax.profile_circle,
                    title: 'Profile',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}



// bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: layoutCubit.currentIndex,
          //   onTap: (value) {
          // print(layoutCubit.currentIndex);
          // layoutCubit.onTap(value);
          //   },
          //   selectedItemColor: AppColors.colorOfBottomNavBarSelected,
          //   items: [
          //     BottomNavigationBarItem(
          // icon: layoutCubit.currentIndex == 0
          //     ? Image.asset(AppAssets.homeIconSelectedPng)
          //     : Image.asset(AppAssets.homeIconUnSelectedPng),
          // label: layoutCubit.currentIndex == 0 ? 'Home' : '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: layoutCubit.currentIndex == 1
          //           ? Image.asset(AppAssets.productIconSelectedPng)
          //           : Image.asset(AppAssets.productIconUnSelectedPng),
          //       label: layoutCubit.currentIndex == 1 ? 'Products' : '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: layoutCubit.currentIndex == 2
          //           ? Image.asset(AppAssets.cartIconSelectedPng)
          //           : Image.asset(AppAssets.cartIconUnSelectedPng),
          //       label: layoutCubit.currentIndex == 2 ? 'Cart' : '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Image.asset(AppAssets.profileIconUnSelectedPng),
          //       label: layoutCubit.currentIndex == 3 ? 'Profile' : '',
          //     ),
          //   ],
          // ),