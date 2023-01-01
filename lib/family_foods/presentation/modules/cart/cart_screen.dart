// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllProductsCubit>(
      // create: (context) => GetAllProductsCubit()..getAllUserCart(),
      create: (context) => GetAllProductsCubit(),
      child: BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // const Duration(milliseconds: 200);
          GetAllProductsCubit getAllProductsCubit =
              GetAllProductsCubit.get(context);
          if (state is GetAllProductsLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return loading();
                    },
                  ),
                ),
              ],
            );
          } else if (state is GetAllProductsSuccessState) {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              onRefresh: () async {
                return await getAllProductsCubit.getAllProducts();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                child: Column(
                  children: [

                  ],
                ),
              ),
            );
          } else {
            return loading();
          }
        },
      ),
    );
  }
}
