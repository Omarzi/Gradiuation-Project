// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'get_all_user_cart_state.dart';

class GetAllUserCartCubit extends Cubit<GetAllUserCartState> {
  GetAllUserCartCubit() : super(GetAllUserCartInitialState());

  static GetAllUserCartCubit get(context) => BlocProvider.of(context);

  final DioHelper dioHelper = DioHelper();
}
