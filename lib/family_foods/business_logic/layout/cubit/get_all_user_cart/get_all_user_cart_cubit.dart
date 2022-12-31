// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/layout/get_all_products/get_all_product.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:meta/meta.dart';
part 'get_all_user_cart_state.dart';

class GetAllUserCartCubit extends Cubit<GetAllUserCartState> {
  GetAllUserCartCubit() : super(GetAllUserCartInitialState());

  static GetAllUserCartCubit get(context) => BlocProvider.of(context);

  List<Products> carts = [];

  final DioHelper dioHelper = DioHelper();

  void getAllUserCart() {
    emit(GetAllCartLoadingState());
    carts = [];
    dioHelper
        .getData(
            endPoint: getAllCarts + MyCache.getString(key: MyCacheKeys.myId))
        .then((value) {
      value.data['Products'].forEach((cart) {
        carts.add(Products.fromJson(cart));
      });
      print(carts);
      emit(GetAllCartSuccessState());
    }).catchError((error) {
      print("Error");
      emit(GetAllCartErrorState());
    });
  }
}
