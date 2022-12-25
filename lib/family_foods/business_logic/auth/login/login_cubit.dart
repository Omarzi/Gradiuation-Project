// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously, avoid_print
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/end_points.dart';
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
      print('===============');
      print(value.data);
      print('===============');
      if (value.data == null) {
        emit(LoginErrorState(error: 'Something Error because Data is Null'));
      } else if (value.data['username'] != null) {
        print(MyCacheKeys.token.toString());
        MyCache.putString(key: MyCacheKeys.token, value: value.data['token']);
        MyCache.putString(key: MyCacheKeys.myUserName, value: value.data['username']);
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
      } else {
        emit(LoginErrorState(error: 'Invalid Data'));
      }
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error: "Some Thing Error in Catch Error"));
    });
  }

  // Logout Function
  void logOut() async {
    emit(LogoutLoadingState());
    log('Logout Success======================');
    await dioHelper
        .getData(endPoint: logout)
        .then(
          (value) => {
            print(value.statusCode),
            // if (value.statusCode == 204)
            //   {
            //     // MyCache.clearShared(),
                emit(LogoutSuccessState()),
              // }
// if              {
//                 log('Have an Error'),
//               },
          },
        )
        .catchError(
      (error) {
        log(error + '============');
      },
    );
  }
}
