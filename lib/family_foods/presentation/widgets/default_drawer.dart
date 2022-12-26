// ignore_for_file: depend_on_referenced_packages, unused_import, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/core/constants/constants.dart';
import 'package:graduation_project/core/utils/app_routes.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login/login_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_listtile.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            'checkScreen',
          );
        }
      },
      builder: (context, state) {
        AuthCubit logouCubit = AuthCubit.get(context);

        return Drawer(
          backgroundColor: AppColors.colorOfBottomNavBarSelected,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.8.w,
              vertical: 5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 15.8.sp,
                        ),
                        children: const [
                          TextSpan(
                            text: 'FAMILY ',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'F',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'OO',
                            style: TextStyle(
                              color: Color(0xFFE8C071),
                            ),
                          ),
                          TextSpan(
                            text: 'DS',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
                        AppAssets.drawerIconPng,
                        color: AppColors.whiteColor,
                        width: 6.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.2.h),
                Container(
                  height: 10.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.progilePhotoPng),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  MyCache.getString(key: MyCacheKeys.myUserName).toString(),
                  style: TextStyle(
                    fontSize: 16.5.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
                SizedBox(height: 0.8.h),
                Text(
                  'Store Owner',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 10.8.sp,
                    color: AppColors.whiteColor,
                  ),
                  softWrap: false,
                ),
                SizedBox(height: 2.h),
                DefaultListTile(
                  leading: const Icon(Iconsax.home_1),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Iconsax.category),
                  title: Text(
                    'Products',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Iconsax.shopping_cart),
                  title: Text(
                    'My Cart',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Iconsax.wallet_check),
                  title: Text(
                    'Payments',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Icons.list_alt_outlined),
                  title: Text(
                    'Shipping Schedule',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Iconsax.heart),
                  title: Text(
                    'Wishlist',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                DefaultListTile(
                  leading: const Icon(Iconsax.personalcard),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onTap: () {},
                ),
                if (state is LoginLoadingState)
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                if (state is! LogoutSuccessState)
                  DefaultListTile(
                    leading: const Icon(Iconsax.logout),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    onTap: () {
                      logouCubit.logOut(context: context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
