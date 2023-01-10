// ignore_for_file: depend_on_referenced_packages, unused_import, unused_local_variable, avoid_print
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/layout/get_all_carts/get_all_carts.dart';
import 'package:graduation_project/data/Models/layout/get_all_products/get_all_product.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/layout_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllProductsCubit>(
      create: (context) => GetAllProductsCubit()
        ..getAllProducts(),
        // ..getAllUserCart(Products()),
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.4,
                  ),
                  itemCount: getAllProductsCubit.products.length,
                  itemBuilder: (context, index) {
                    String img =
                        '$baseUrl${getAllProductsCubit.products[index].img}';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: NetworkImage(img), fit: BoxFit.cover),
                          ),
                        ),
                        // child: Image.network(
                        //   img,
                        // ),
                        // ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getAllProductsCubit.products[index].name!,
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColors.balckColor2Played,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${getAllProductsCubit.products[index].price!}'
                                  .toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          getAllProductsCubit.products[index].expDate!,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.colorOfBottomNavBarSelected,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: BlocConsumer<LayoutCubit, LayoutState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: BlocConsumer<LayoutCubit, LayoutState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return IconButton(
                                    onPressed: () {
                                      LayoutCubit.get(context).addToCart(
                                        productid: getAllProductsCubit
                                            .products[index].sId!,
                                        quantity: 50.toString(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
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
