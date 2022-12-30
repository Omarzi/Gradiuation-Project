// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously, avoid_print
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/Models/auth/login_model.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/data/data_provider/remote/dio_helper.dart';
part 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;
  bool pass = false;

  final DioHelper dioHelper = DioHelper();

  void changePasswordVisibity() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

  void changePasswordVisibityForRegister() {
    pass = !pass;
    emit(PasswordVisibilityState());
  }

  // Login Function
  void signIn({
    required String email,
    required String phone,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    log('Login Success======================');
    dioHelper.postData(endPoint: loginEndPoint, body: {
      "email": email,
      "phone": phone,
      "password": password,
    }).then((value) {
      debugPrint(value.data.toString());
        MyCache.putString(key: MyCacheKeys.token, value: value.data['token']);
        MyCache.putString(
            key: MyCacheKeys.myUserName, value: value.data['username']);
        MyCache.putInt(key: MyCacheKeys.roles, value: value.data['roles']);
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error: "Some Thing Error in Catch Error"));
    });
  }

  // Logout Function
  void logOut({
    required BuildContext context,
  }) async {
    emit(LogoutLoadingState());
    log('Logout Success');
    await dioHelper
        .getData(endPoint: logout)
        .then(
          (value) => {
            print(value.statusCode),
            MyCache.clearShared(),
            emit(LogoutSuccessState()),
          },
        )
        .catchError(
      (error) {
        log(error + '============');
      },
    );
  }
}
