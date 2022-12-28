// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/auth/six_digits.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:graduation_project/core/constants/states_enum/forget_enum.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;

  final DioHelper dioHelper = DioHelper();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController otbController = TextEditingController();

  Map? id;

  // -------------------- //
  // Start Send Email //

  void sendEmailInForgetPassword({
    required String email,
    required BuildContext context,
  }) {
    log('Start Loading');
    emit(ForgetPasswordLoadingState());
    log('End Loading');
    dioHelper.postData(endPoint: forgetPassword, body: {
      "email": email,
    }).then((value) {
      print('===============');
      print(value.statusCode);
      print('===============');
      emit(const GetForgetPasswordState(forgetState_: States.success));
      flutterToast(
          msg: 'Success, Now Check Your Email', color: AppColors.primaryColor);
      Navigator.pushNamedAndRemoveUntil(
          context, 'sendSixDigitsScreen', (route) => false);
    }).catchError((error) {
      if (error.response.statusCode == 403) {
        log("Error 403");
        emit(const GetForgetPasswordState(forgetState_: States.error));
        flutterToast(msg: 'Error Exist', color: AppColors.primaryColor);
      }
    });
  }

  // -------------------- //
  // End Send Email //

  // -------------------- //
  // Start Get 6 Digits //

  void sixDigits({required BuildContext context}) {
    emit(SendSixDigitsLoadingState());
    dioHelper.postData(endPoint: reset, body: {
      "OTP": otbController.text,
      "email": emailController.text
    }).then((value) {
      MyCache.putString(key: MyCacheKeys.myId, value: value.data['id']);
      emit(SendSixDigitsSucessState());
      flutterToast(
        msg: 'Success',
        color: AppColors.primaryColor,
      );
      Navigator.pushNamedAndRemoveUntil(
          context, 'createNewPasswordScreen', (route) => false);
    }).catchError((onError) {
      if (onError.response.statusCode == 403) {
        emit(const GetForgetPasswordState(forgetState_: States.error));
        flutterToast(msg: 'Error Exist', color: AppColors.primaryColor);
        print(onError);
      }
    });
  }

  // -------------------- //
  // End Get 6 Digits //

  // -------------------- //
  // Start Update Password //

  void updateNewPasswordInForgetPassword({
    required String newPassword,
    required BuildContext context,
  }) {
    emit(UpdateNewPasswordLoadingState());
    dioHelper.postData(endPoint: updatePassword, body: {
      "id": MyCache.getString(key: MyCacheKeys.myId),
      "newPassword": newPassword,
    }).then((value) {
      emit(UpdateNewPasswordSuccessState());
      flutterToast(
        msg: 'Success',
        color: AppColors.primaryColor,
      );
      flutterToast(
        msg: 'Update Success',
        color: AppColors.primaryColor,
      );
      Navigator.pushNamedAndRemoveUntil(
          context, 'loginScreen', (route) => false);
    }).catchError((error) {
      emit(ForgetPasswordErrorState(
          error: "Some Thing Error in Catch Error in confirm Password"));
    });
  }

  // -------------------- //
  // End Update Password //
}
