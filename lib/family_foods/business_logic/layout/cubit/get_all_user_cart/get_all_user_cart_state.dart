part of 'get_all_user_cart_cubit.dart';

@immutable
abstract class GetAllUserCartState {}

class GetAllUserCartInitialState extends GetAllUserCartState {}

class GetAllCartLoadingState extends GetAllUserCartState {}

class GetAllCartSuccessState extends GetAllUserCartState {}

class GetAllCartErrorState extends GetAllUserCartState {}
