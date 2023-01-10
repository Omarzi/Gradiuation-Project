// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password-cubit/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class SendEmailScreen extends StatelessWidget {
  final GlobalKey<FormState> sendPasswordKey = GlobalKey<FormState>();

  String? email;

  SendEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordErrorState) {
          flutterToast(
            msg: 'Send in Failer',
            color: AppColors.primaryColor,
          );
          // } else if (state is ForgetPasswordLoadingState) {
          //   Center(
          //     child: CircularProgressIndicator(
          //       color: AppColors.primaryColor,
          //     ),
          //   );
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit forgetPasswordCubit =
            ForgetPasswordCubit.get(context);
        return StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? Scaffold(
                      backgroundColor: AppColors.transparentColor,
                      body: buildNoInternetWidget(),
                    )
                  : Scaffold(
                      // backgroundColor: AppColors.transparentColor,
                      // appBar: PreferredSize(
                      //   preferredSize: Size.fromHeight(7.h),
                      //   child: const DefaultAppBarInAuth(),
                      // ),
                      body: Form(
                        key: sendPasswordKey,
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    forgetPasswordCubit.emailController.clear();
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.balckColor2Played,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'PASSWORD RECOVERY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Image.asset(AppAssets.sendEmailIconPng,
                                height: 20.h),
                            SizedBox(height: 4.4.h),
                            Text(
                              'Please Enter Your Phone Or E-mail',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 5.w),
                              child: DefaultTextFormField(
                                textEditingController:
                                    forgetPasswordCubit.emailController,
                                isObscureText: false,
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
                                textInputType: TextInputType.emailAddress,
                                imagePreffixIcon: AppAssets.emailIconPng,
                                imageSuffixIcon: '',
                                hintText: 'PHONE OR E-MAIL',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (state is ForgetPasswordLoadingState)
                              Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            if (state is! ForgetPasswordLoadingState)
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 15.w),
                                child: DefaultButton(
                                  bgColor: AppColors.primaryColor,
                                  text: 'Continue',
                                  textColor: AppColors.whiteColor,
                                  fontSize: 14.sp,
                                  size: Size(60.w, 6.8.h),
                                  onPressed: () {
                                    if (sendPasswordKey.currentState!
                                        .validate()) {
                                          forgetPasswordCubit.emailController.clear();
                                      forgetPasswordCubit
                                          .sendEmailInForgetPassword(
                                        email: forgetPasswordCubit
                                            .emailController.text,
                                        context: context,
                                      );
                                      if(state is ForgetPasswordSuccessState) {
                                        forgetPasswordCubit.emailController.clear();
                                      }
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
            });
      },
    );
  }
}
