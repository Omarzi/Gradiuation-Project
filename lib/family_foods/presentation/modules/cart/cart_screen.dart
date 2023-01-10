// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  List<String> names = [
    'pesa',
    'pesa',
    'pesa',
    'pesa',
    'pesa',
  ];

  List<String> images = [
    AppAssets.chairPhotoPng,
    AppAssets.watchPhotoPng,
    AppAssets.chairPhotoPng,
    AppAssets.watchPhotoPng,
    AppAssets.chairPhotoPng,
  ];

  List<String> prices = [
    '100',
    '110',
    '2500',
    '400',
    '430',
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllProductsCubit>(
      // create: (context) => GetAllProductsCubit()..getAllUserCart(),
      create: (context) => GetAllProductsCubit(),
      child: BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // // const Duration(milliseconds: 200);
          // GetAllProductsCubit getAllProductsCubit =
          //     GetAllProductsCubit.get(context);
          // if (state is GetAllProductsLoadingState) {
          //   return Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: ListView.separated(
          //           physics: const NeverScrollableScrollPhysics(),
          //           separatorBuilder: (context, index) {
          //             return const SizedBox();
          //           },
          //           itemCount: 6,
          //           itemBuilder: (context, index) {
          //             return loading();
          //           },
          //         ),
          //       ),
          //     ],
          //   );
          // } else if (state is GetAllProductsSuccessState) {
          //   return RefreshIndicator(
          //     color: AppColors.primaryColor,
          //     onRefresh: () async {
          //       return await getAllProductsCubit.getAllProducts();
          //     },
          // child: Container(
          return Column(
            children: [
              Expanded(
                child: Container(
                  // width: double.infinity,
                  // padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                  child: ListView.separated(
                    itemCount: names.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 2.h);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        height: 14.h,
                        child: Row(
                          children: [
                            Container(
                              width: 35.w,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    '\$ ${prices[index]}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Container(
                                    width: 30.w,
                                    color: Colors.grey.shade200,
                                    height: 4.8.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: AppColors.blackColor,
                                        ),
                                        SizedBox(width: 1.5.w),
                                        Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        SizedBox(width: 1.5.w),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 2.h),
                                          child: const Icon(
                                            Icons.minimize,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  // ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 16.2.sp,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          '\$ 10800',
                          style: TextStyle(
                            fontSize: 12.2.sp,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 14.h,
                      width: 45.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                      child: DefaultButton(
                        bgColor: Colors.green,
                        text: 'CHECKOUT',
                        textColor: AppColors.whiteColor,
                        fontSize: 12.sp,
                        size: Size(5.w, 5.h),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
          // } else {
          //   return loading();
          // }
        },
      ),
    );
  }
}
