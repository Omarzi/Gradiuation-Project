import 'package:graduation_project/family_foods/business_logic/auth/login-cubit/login_cubit.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, must_be_immutable
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/core/utils/app_routes.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:connectivity/connectivity.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  // String? email, phone, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          flutterToast(
            msg: 'Logged in Failer',
            color: AppColors.primaryColor,
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            'layoutScreen',
          );
        }
      },
      builder: (context, state) {
        AuthCubit loginCubit = AuthCubit.get(context);
        return StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: ((context, snapshot) {
            return Stack(
              children: [
                Image.asset(
                  AppAssets.mainBackgroundPng,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                snapshot.data == ConnectivityResult.none
                    ? Scaffold(
                        backgroundColor: AppColors.transparentColor,
                        body: buildNoInternetWidget(),
                      )
                    : Scaffold(
                        backgroundColor: AppColors.transparentColor,
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(7.h),
                          child: const DefaultAppBarInAuth(),
                        ),
                        body: Form(
                          key: loginKey,
                          child: ListView(
                            children: [
                              Image.asset(AppAssets.logoForLoginPng,
                                  height: 15.h),
                              SizedBox(height: 0.6.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login to Your account',
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Column(
                                  children: [
                                    DefaultTextFormField(
                                      hintText: 'Email address',
                                      imagePreffixIcon: AppAssets.emailIconPng,
                                      imageSuffixIcon: '',
                                      textInputType: TextInputType.emailAddress,
                                      textEditingController: emailController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Your Email';
                                        } else if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                            .hasMatch(value)) {
                                          return 'Please Enter Valid as example@gmail.com';
                                        }
                                      },
                                      // onChanged: (value) {
                                      //   email = value;
                                      // },
                                    ),
                                    SizedBox(height: 2.5.h),
                                    DefaultTextFormField(
                                      isPasswordField: true,
                                      hintText: 'Password',
                                      imagePreffixIcon:
                                          AppAssets.passwordIconPng,
                                      imageSuffixIcon: AppAssets.eyeIconPng,
                                      textEditingController: passwordController,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Your Password';
                                        } else if (value.length < 3) {
                                          return 'Please Confirm Password is Week';
                                        }
                                      },
                                      // onChanged: (value) {
                                      //   password = value;
                                      // },
                                    ),
                                    SizedBox(height: 2.5.h),
                                    DefaultTextFormField(
                                      hintText: 'Phone Number',
                                      imagePreffixIcon:
                                          AppAssets.passwordIconPng,
                                      imageSuffixIcon: AppAssets.eyeIconPng,
                                      textEditingController: phoneController,
                                      textInputType: TextInputType.phone,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Your Phone Number';
                                        } else if (value.length < 3) {
                                          return 'Please Confirm Password is Week';
                                        }
                                      },
                                      // onChanged: (value) {
                                      //   phone = value;
                                      // },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 0.8.h,
                                            horizontal: 4.w,
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                'sendPasswordScreen',
                                              );
                                            },
                                            child: Text(
                                              "Forget Password?",
                                              style: TextStyle(
                                                color:
                                                    AppColors.blackColorPlayed,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.2.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.5.h),
                                    if (state is LoginLoadingState)
                                      Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    if (state is! LoginLoadingState)
                                      DefaultButton(
                                        bgColor: AppColors.primaryColor,
                                        text: 'Sign in',
                                        textColor: AppColors.whiteColor,
                                        fontSize: 15.sp,
                                        size: Size(90.w, 6.8.h),
                                        onPressed: () {
                                          if (loginKey.currentState!
                                              .validate()) {
                                            loginCubit.signIn(
                                              email: emailController.text,
                                              phone: phoneController.text,
                                              password: passwordController.text,
                                              context: context,
                                            );
                                          }
                                        },
                                      ),
                                    SizedBox(height: 3.8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Dont't Have An Account ?",
                                          style: TextStyle(
                                            color: AppColors.balckColor2Played,
                                            fontSize: 12.2.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.8.h),
                                    DefaultButton(
                                      bgColor: AppColors.primaryColor,
                                      text: 'Sign up',
                                      textColor: AppColors.whiteColor,
                                      fontSize: 14.sp,
                                      size: Size(90.w, 6.8.h),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          'registerScreen',
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            );
          }),
        );
      },
    );
  }
}
