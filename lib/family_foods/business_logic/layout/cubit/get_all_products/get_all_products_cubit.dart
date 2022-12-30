// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/get_all_products/get_all_product.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitialState());

  static GetAllProductsCubit get(context) => BlocProvider.of(context);

  final DioHelper dioHelper = DioHelper();

  GetAllProductsModel getAllProductsModel = GetAllProductsModel();

  // get All Products
  Future<void> getAllProducts({
    required BuildContext context,
  }) async {
    emit(GetAllProductsLoadingState());
    await dioHelper.getData(endPoint: getAllProductsEndPoint).then((value) {
      log(value.statusCode.toString());
      print(value.data);
      getAllProductsModel = GetAllProductsModel.fromJson(value.data);
      emit(
        GetAllProductsSuccessState(
          getAllProductsModel: getAllProductsModel.products!,
        ),);
    }).catchError((error) {
      print(error);
      emit(GetAllProductsErrorState());
    });
  }
}
