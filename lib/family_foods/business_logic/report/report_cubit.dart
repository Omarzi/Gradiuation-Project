// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitialState());

  static ReportCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  void report({
    required String name,
    required String phone,
    required String position,
    required String message,
    required BuildContext context,
  }) {
    emit(ReportLoadingState());
    dioHelper.postData(endPoint: reportAProblem, body: {
      "name": name,
      "phone": phone,
      "position": position,
      "message": message,
    }).then((value) {
      print('===============');
      print(value.data);
      print('===============');
      if (value.data == null) {
        emit(ReportErrorState(error: 'Something Error because Data is Null'));
      } else if (value.data['message'] != null) {
        emit(ReportSuccessState());
      } else {
        emit(ReportErrorState(error: 'Invalid Data'));
      }
    }).catchError((error) {
      print(error);
      emit(ReportErrorState(error: "Some Thing Error in Catch Error"));
    });
  }
}
