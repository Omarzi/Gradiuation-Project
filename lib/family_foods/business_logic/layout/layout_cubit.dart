// ignore_for_file: depend_on_referenced_packages, body_might_complete_normally_nullable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void Function(int)? onTap(int value) {
    currentIndex = value;
    emit(LayoutSuccessState());
  }
}
