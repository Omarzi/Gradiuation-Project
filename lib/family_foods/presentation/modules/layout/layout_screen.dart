// ignore_for_file: must_be_immutable, depend_on_referenced_packages, avoid_print
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
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
import 'package:connectivity/connectivity.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class LayoutScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  LayoutScreen({super.key});

  List<Widget> tabs = [
    HomeScreen(),
    const ProductScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit layoutCubit = LayoutCubit.get(context);
        return StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: ((context, snapshot) {
            return snapshot.data == ConnectivityResult.none
                ? Scaffold(
                    body: buildNoInternetWidget(),
                  )
                : Scaffold(
                    key: scaffoldKey,
                    // drawer: const DefaultDrawer(),
                    /*
                    IconButton(
          onPressed: () {},
          icon: Icon(
            Iconsax.notification,
            color: AppColors.blackColor,
          ),
          // width: 6.w,
          // ),
        ),
                    */
                    appBar: PreferredSize(
                      preferredSize: Size(double.infinity, 7.h),
                      child: DefaultAppBarInAllScreens(
                        scaffoldKey: scaffoldKey,
                        title: layoutCubit.currentIndex == 0
                            ? const Text(
                                'Home',
                                style: TextStyle(color: AppColors.blackColor),
                              )
                            : layoutCubit.currentIndex == 1
                                ? const Text(
                                    'Search',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  )
                                : layoutCubit.currentIndex == 2
                                    ? const Text(
                                        'My Cart',
                                        style: TextStyle(
                                            color: AppColors.blackColor),
                                      )
                                    : layoutCubit.currentIndex == 3
                                        ? const Text(
                                            'Profile',
                                            style: TextStyle(
                                                color: AppColors.blackColor),
                                          )
                                        : Container(),
                        actions: [
                          layoutCubit.currentIndex == 0
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Iconsax.notification,
                                    color: AppColors.blackColor,
                                  ),
                                )
                              : layoutCubit.currentIndex == 1
                                  ? Container()
                                  : layoutCubit.currentIndex == 2
                                      ? Container()
                                      : layoutCubit.currentIndex == 3
                                          ? Container()
                                          : Container(),
                        ],
                      ),
                    ),
                    body: tabs[layoutCubit.currentIndex],
                    bottomNavigationBar: Container(
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.6.h,
                          horizontal: 1.8.w,
                        ),
                        child: GNav(
                          backgroundColor: AppColors.whiteColor,
                          color: AppColors.blackColor.withOpacity(0.7),
                          activeColor: AppColors.primaryColor,
                          tabBackgroundColor:
                              AppColors.greyColorPlayed.withOpacity(0.3),
                          padding: EdgeInsets.all(16.sp),
                          gap: 3.w,
                          onTabChange: (value) {
                            layoutCubit.onTap(value);
                          },
                          tabs: const [
                            GButton(
                              icon: Icons.home,
                              text: 'Home',
                            ),
                            GButton(
                              icon: Icons.search,
                              text: 'Search',
                            ),
                            GButton(
                              icon: Icons.shopping_cart,
                              text: 'Cart',
                            ),
                            GButton(
                              icon: Icons.person,
                              text: 'Profile',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
        );
      },
    );
  }
}
