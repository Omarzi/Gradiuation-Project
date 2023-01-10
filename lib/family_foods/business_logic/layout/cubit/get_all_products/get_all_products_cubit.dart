// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/layout/get_all_carts/get_all_carts.dart';
import 'package:graduation_project/data/Models/layout/get_all_products/get_all_product.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitialState());

  static GetAllProductsCubit get(context) => BlocProvider.of(context);

  final DioHelper dioHelper = DioHelper();

  GetAllProductsModel getAllProductsModel = GetAllProductsModel();

  List<Products> products = [];

  // get All Products
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoadingState());
    products = [];
    await dioHelper.getData(endPoint: getAllProductsEndPoint).then((value) {
      log(value.statusCode.toString());
      print('Get All Products');
      value.data['Products'].forEach((product) {
        products.add(Products.fromJson(product));
      });
      emit(
        GetAllProductsSuccessState(),
      );
    }).catchError((error) {
      print(error);
      emit(GetAllProductsErrorState());
    });
  }

  List<CartModel> carts = [];

  void getAllUserCart() {
    emit(GetAllCartLoadingState());
    carts = [];
    dioHelper
        .getData(
            endPoint: getAllCarts + MyCache.getString(key: MyCacheKeys.myId))
        .then((value) async {
      // carts = await value.data['products'];
      // print(carts.toString());
      print('Get All User Cart');
      value.data['products'].forEach((cart) {
        carts.add(CartModel.fromJson(cart));
      });
      print(carts);
      emit(GetAllCartSuccessState());
    }).catchError((error) {

      print("Error In Get All Cart");
      emit(GetAllCartErrorState());
    });
  }
}
