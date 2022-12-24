// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/core/end_points.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login/login_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pushNamed(context, 'checkScreen');
        }
      },
      builder: (context, state) {
        AuthCubit logouCubit = AuthCubit.get(context);
        return Stack(
          children: [
            Image.asset(
              AppAssets.mainBackgroundPng,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Scaffold(
              backgroundColor: AppColors.transparentColor,
              appBar: AppBar(
                backgroundColor: AppColors.transparentColor,
                elevation: 0.0,
                title: const Text("Home Screen"),
                actions: [
                  if (state is LogoutLoadingState)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  if (state is! LogoutLoadingState)
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, 'checkScreen', (route) => false);
                        // DioHelper.logout(context);
                        MyCache.putString(key: MyCacheKeys.token, value: "1");
                        logouCubit.logOut();
                        // DioHelper.logout(context);
                      },
                      icon: const Icon(Icons.logout),
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
