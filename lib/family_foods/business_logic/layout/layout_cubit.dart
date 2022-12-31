// ignore_for_file: depend_on_referenced_packages, body_might_complete_normally_nullable, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/layout/get_all_products/get_all_product.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  DioHelper dioHelper = DioHelper();
  

  void Function(int)? onTap(int value) {
    currentIndex = value;
    emit(LayoutSuccessState());
  }

  void addToCart({
    required String productid,
    required String quantity,
  }) {
    emit(AddToCartLoadingState());
    dioHelper.postData(
        endPoint: '$addToCarts${MyCache.getString(key: MyCacheKeys.myId)}',
        token: MyCache.getString(key: MyCacheKeys.token),
        body: {
          "productId": productid,
          "quantity": quantity,
        }).then((value) {
      print('Success');
      emit(AddToCartSuccessState());
      // ignore: todo
      // TODO : ADD Get All Carts
    }).catchError((error) {
      print('Error');
      emit(AddToCartErrorState());
    });
  }
}
