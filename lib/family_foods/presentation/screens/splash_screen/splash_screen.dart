// ignore_for_file: depend_on_referenced_packages, must_be_immutable, unnecessary_null_comparison, unrelated_type_equality_checks
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/family_foods/presentation/modules/layout/layout_screen.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        return snapshot.data == ConnectivityResult.none
            ? Scaffold(
                body: buildNoInternetWidget(),
              )
            : Scaffold(
                body: OfflineBuilder(
                  connectivityBuilder: (
                    BuildContext context,
                    ConnectivityResult connectivity,
                    Widget child,
                  ) {
                    final bool connected =
                        connectivity != ConnectivityResult.none;
                    if (connected) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        child: Column(
                          children: [
                            // Image.asset(AppAssets.mainLogoPng),
                            SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.mainLogoPng),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.h,
                              ),
                              child: LinearPercentIndicator(
                                animation: true,
                                lineHeight: 7.0,
                                animationDuration: 2500,
                                percent: 1,
                                barRadius: const Radius.circular(50),
                                progressColor: AppColors.primaryColor,
                                onAnimationEnd: () {
                                  log("==============");
                                  log(MyCache.getString(
                                      key: MyCacheKeys.token));
                                  if (MyCache.getString(
                                          key: MyCacheKeys.token) ==
                                      "") {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      'checkScreen',
                                      
                                    );
                                  } else {
                                    log('Home Layout');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LayoutScreen(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return buildNoInternetWidget();
                    }
                  },
                  child: showLoadingIndicator(),
                ),
              );
      },
    );
  }
}
