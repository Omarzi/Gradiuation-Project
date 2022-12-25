// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/core/constant_methods.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/auth/forget-password/forget_password_cubit.dart';

class SendPasswordScreen extends StatelessWidget {
  static const String routeName = 'sendPasswordScreen';

  // TextEditingController? emailController;

  final GlobalKey<FormState> sendPasswordKey = GlobalKey<FormState>();

  String? email;

  SendPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordErrorState) {
          flutterToast(
            msg: 'Send in Failer',
            color: AppColors.primaryColor,
          );
        } else if (state is ForgetPasswordSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, 'sendSixDigitsScreen', (route) => false);
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit forgetPasswordCubit =
            ForgetPasswordCubit.get(context);
        return Stack(
          children: [
            Image.asset(
              AppAssets.mainBackgroundPng,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Scaffold(
              backgroundColor: AppColors.transparentColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(7.h),
                child: const DefaultAppBarInAuth(),
              ),
              body: Form(
                key: sendPasswordKey,
                child: ListView(
                  children: [
                    SizedBox(height: 0.6.h),
                    Text(
                      'PASSWORD RECOVERY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Image.asset(AppAssets.sendEmailIconPng, height: 20.h),
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
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: DefaultTextFormField(
                        textEditingController: forgetPasswordCubit.emailController,
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
                        onChanged: (value) {
                          email = value;
                        },
                        textInputType: TextInputType.emailAddress,
                        imagePreffixIcon: AppAssets.emailIconPng,
                        imageSuffixIcon: '',
                        hintText: 'PHONE OR E-MAIL',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (state is ForgetPasswordLoadingState)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    if (state is! ForgetPasswordLoadingState)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: DefaultButton(
                          bgColor: AppColors.primaryColor,
                          text: 'Continue',
                          textColor: AppColors.whiteColor,
                          fontSize: 14.sp,
                          size: Size(60.w, 6.8.h),
                          onPressed: () {
                            if (sendPasswordKey.currentState!.validate()) {
                              forgetPasswordCubit.sendEmailInForgetPassword(
                                email: email!,
                                context: context,
                              );
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
