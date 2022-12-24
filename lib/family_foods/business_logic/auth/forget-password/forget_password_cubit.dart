// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant_methods.dart';
import 'package:graduation_project/core/end_points.dart';
import 'package:graduation_project/data/Models/auth/six_digits.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
import 'package:graduation_project/family_foods/business_logic/states_enum/forget_enum.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;

  final DioHelper dioHelper = DioHelper();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController otbController = TextEditingController();

  String? id;

  // Send Email
  void sendEmailInForgetPassword({
    required String email,
    required BuildContext context,
  }) {
    emit(const GetForgetPasswordState(forgetState_: States.loading));
    // emit(ForgetPasswordLoadingState());
    dioHelper.postData(endPoint: forgetPassword, body: {
      "email": email,
    }).then((value) {
      print('===============');
      print(value.statusCode);
      print('===============');
      if (value.statusCode == 200) {
        emit(const GetForgetPasswordState(forgetState_: States.success));
        // emit(ForgetPasswordSuccessState());
      } else {
        emit(const GetForgetPasswordState(forgetState_: States.error));
        // emit(ForgetPasswordErrorState(error: value.data['message']));
      }
    }).catchError((error) {
      emit(const GetForgetPasswordState(forgetState_: States.error));
      print("Some Thing Error in Catch Error in Forget Password");
      // emit(ForgetPasswordErrorState(
      //     error: "Some Thing Error in Catch Error in Forget Password"));
    });
  }

  // Get 6 Digits
  void sixDigits({required BuildContext context}) {
    emit(const GetForgetPasswordState(forgetState_: States.loading));
    dioHelper.postData(endPoint: reset, body: {
      "OTP": otbController.text,
      "email": emailController.text
    }).then((value) {
      print("sucess");
      Navigator.pushNamedAndRemoveUntil(
          context, 'createNewPasswordScreen', (route) => false);
      emit(const GetForgetPasswordState(forgetState_: States.success));
      print("success");
    }).catchError((onError) {
      emit(const GetForgetPasswordState(forgetState_: States.error));
      print(onError);
    });
  }

  // Update Password
  void updateNewPasswordInForgetPassword({
    // required String id,
    required String newPassword,
    required String confirmNewPassword,
    required BuildContext context,
  }) {
    emit(const GetForgetPasswordState(forgetState_: States.loading));
    // emit(ForgetPasswordLoadingState());
    dioHelper.postData(endPoint: updatePassword, body: {
      "id": id,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    }).then((value) {
      print('===============');
      print(value.data);
      print('===============');
      if (value.statusCode == 200) {
        // emit(ForgetPasswordSuccessState());
        emit(const GetForgetPasswordState(forgetState_: States.success));
        Navigator.pushNamedAndRemoveUntil(
            context, 'loginScreen', (route) => false);
        flutterToast(
          msg: 'Update Success',
          color: AppColors.primaryColor,
        );
      } else {
        emit(const GetForgetPasswordState(forgetState_: States.error));
        // emit(ForgetPasswordErrorState(error: value.data['message']));
      }
    }).catchError((error) {
      emit(ForgetPasswordErrorState(
          error: "Some Thing Error in Catch Error in confirm Password"));
    });
  }
}
