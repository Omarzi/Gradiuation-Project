// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password-cubit/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:connectivity/connectivity.dart';

class SendSixDigits extends StatelessWidget {
  TextEditingController? digitsContoller;

  final GlobalKey<FormState> sendSixDigitsPasswordKey = GlobalKey<FormState>();

  String? digits;

  SendSixDigits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is SendSixDigitsErrorState) {
          flutterToast(
            msg: 'Send in Failer',
            color: AppColors.primaryColor,
          );
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit sendDigitsCubit = ForgetPasswordCubit.get(context);
        return StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? Scaffold(
                      // backgroundColor: AppColors.transparentColor,
                      body: buildNoInternetWidget(),
                    )
                  : Scaffold(
                      // backgroundColor: AppColors.transparentColor,
                      body: Form(
                        key: sendSixDigitsPasswordKey,
                        child: ListView(
                          children: [
                            SizedBox(height: 10.h),
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
                              'Please Enter The 6 Digit Code we Sent You',
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
                                textEditingController:
                                    sendDigitsCubit.otbController,
                                isObscureText: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter The Digits';
                                  }
                                },
                                textInputType: TextInputType.phone,
                                // ignore: todo
                                // TODO : Will Add Number Icon
                                imagePreffixIcon: AppAssets.emailIconPng,
                                imageSuffixIcon: '',
                                hintText: 'OTP',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (state is SendSixDigitsLoadingState)
                              Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            if (state is! SendSixDigitsLoadingState)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: DefaultButton(
                                  bgColor: AppColors.primaryColor,
                                  text: 'Continue',
                                  textColor: AppColors.whiteColor,
                                  fontSize: 14.sp,
                                  size: Size(60.w, 6.8.h),
                                  onPressed: () {
                                    if (sendSixDigitsPasswordKey.currentState!
                                        .validate()) {
                                      sendDigitsCubit.sixDigits(
                                          context: context);
                                    if(state is SendSixDigitsSucessState) {
                                      sendDigitsCubit.otbController.clear();
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
