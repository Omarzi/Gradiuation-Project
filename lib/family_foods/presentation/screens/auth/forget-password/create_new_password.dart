// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/core/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  static const String routeName = 'createNewPasswordScreen';

  final String? id;

  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  final GlobalKey<FormState> createNewPasswordKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({super.key, this.id});

  String? newPassword, updateNewPassword;

  @override
  Widget build(BuildContext context) {
    const bool isPassword = false;
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is UpdateNewPasswordErrorState) {
          flutterToast(
            msg: 'Update in Failer',
            color: AppColors.primaryColor,
          );
        }
        // } else if (state is UpdateNewPasswordSuccessState) {
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, 'loginScreen', (route) => false);
        // }
      },
      builder: (context, state) {
        ForgetPasswordCubit updatePasswordCubit =
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
                key: createNewPasswordKey,
                child: ListView(
                  children: [
                    SizedBox(height: 0.6.h),
                    Image.asset(AppAssets.createNewPasswordIconPng,
                        height: 25.h),
                    SizedBox(height: 4.4.h),
                    Text(
                      'Create A New Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: DefaultTextFormField(
                        isPasswordField: !isPassword,
                        hintText: 'Password',
                        imagePreffixIcon: AppAssets.passwordIconPng,
                        imageSuffixIcon: AppAssets.eyeIconPng,
                        textEditingController: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Password';
                          } else if (value.length < 3) {
                            return 'Please Confirm Password is Week';
                          }
                        },
                        onChanged: (value) {
                          newPassword = value;
                        },
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: DefaultTextFormField(
                        isPasswordField: !isPassword,
                        hintText: 'Confitm Password',
                        imagePreffixIcon: AppAssets.passwordIconPng,
                        imageSuffixIcon: AppAssets.eyeIconPng,
                        textEditingController: confirmPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Confirm Password';
                          } else if (value.length < 3) {
                            return 'Please Confirm Password is Week';
                          } else if (newPassword != updateNewPassword) {
                            return "Confirm Password is'nt Similar Password";
                          }
                        },
                        onChanged: (value) {
                          updateNewPassword = value;
                        },
                      ),
                    ),
                    SizedBox(height: 6.h),
                    if (state is UpdateNewPasswordLoadingState)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    if (state is! UpdateNewPasswordLoadingState)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: DefaultButton(
                          bgColor: AppColors.primaryColor,
                          text: 'Submit',
                          textColor: AppColors.whiteColor,
                          fontSize: 14.sp,
                          size: Size(60.w, 6.8.h),
                          onPressed: () {
                            if (createNewPasswordKey.currentState!.validate()) {
                              updatePasswordCubit
                                  .updateNewPasswordInForgetPassword(
                                      newPassword: newPassword!,
                                      confirmNewPassword: updateNewPassword!,
                                      context: context);
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
