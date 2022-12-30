// ignore_for_file: must_be_immutable
part of 'get_all_products_cubit.dart';

@immutable
abstract class GetAllProductsState {}

class GetAllProductsInitialState extends GetAllProductsState {}

class GetAllProductsLoadingState extends GetAllProductsState {}

class GetAllProductsSuccessState extends GetAllProductsState {
  List<Products> getAllProductsModel; 
  GetAllProductsSuccessState({
    required this.getAllProductsModel,
  });
}

class GetAllProductsErrorState extends GetAllProductsState {}
