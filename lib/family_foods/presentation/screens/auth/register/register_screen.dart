// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_assets.dart';
import 'package:graduation_project/core/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/auth/register/register_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'registerScreen';

  RegisterScreen({super.key});

  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? phoneController;

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  String? username, phone, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    const bool isPassword = true;

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          flutterToast(
            msg: 'Register in Failer',
            color: AppColors.primaryColor,
          );
        } else if (state is RegisterSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, 'loginScreen', (route) => false);
        }
      },
      builder: (context, state) {
        RegisterCubit registerCubit = RegisterCubit.get(context);
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
                child: const DefaultAppBar(),
              ),
              body: Form(
                key: registerKey,
                child: ListView(
                  children: [
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        'Register a New Employee',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        children: [
                          DefaultTextFormField(
                            isObscureText: isPassword,
                            hintText: 'Full Name',
                            imagePreffixIcon: AppAssets.personIconPng,
                            imageSuffixIcon: '',
                            textEditingController: userNameController,
                            textInputType: TextInputType.text,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Name';
                              } else if (value.length < 3) {
                                return 'Please The Name is Week';
                              }
                            },
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          SizedBox(height: 2.5.h),
                          DefaultTextFormField(
                            isObscureText: isPassword,
                            hintText: 'Email address',
                            imagePreffixIcon: AppAssets.emailIconPng,
                            imageSuffixIcon: '',
                            textEditingController: emailController,
                            textInputType: TextInputType.emailAddress,
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
                          ),
                          SizedBox(height: 2.5.h),
                          DefaultTextFormField(
                            isPasswordField: true,
                            hintText: 'Password',
                            imagePreffixIcon: AppAssets.passwordIconPng,
                            imageSuffixIcon: AppAssets.eyeIconPng,
                            textEditingController: passwordController,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Password';
                              } else if (value.length < 3) {
                                return 'Please Password is Week';
                              }
                            },
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          SizedBox(height: 2.5.h),
                          DefaultTextFormField(
                            check: true,
                            isObscureText: !isPassword,
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
                              } else if (password != confirmPassword) {
                                return "Confirm Password is'nt Similar Password";
                              }
                            },
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                          ),
                          SizedBox(height: 2.5.h),
                          DefaultTextFormField(
                            isObscureText: isPassword,
                            hintText: 'Phone Number',
                            imagePreffixIcon: AppAssets.passwordIconPng,
                            imageSuffixIcon: AppAssets.eyeIconPng,
                            textEditingController: phoneController,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Phone Number';
                              } else if (value.length <= 10) {
                                return 'Please Enter Valid Phone Number';
                              }
                            },
                            onChanged: (value) {
                              phone = value;
                            },
                          ),
                          SizedBox(height: 3.8.h),
                          if (state is RegisterLoadingState)
                            const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          if (state is! RegisterLoadingState)
                            DefaultButton(
                                bgColor: AppColors.primaryColor,
                                text: 'Register',
                                textColor: AppColors.whiteColor,
                                fontSize: 13.sp,
                                size: Size(90.w, 6.8.h),
                                onPressed: () async {
                                  if (registerKey.currentState!.validate()) {
                                    await registerCubit.signup(
                                      username: username!,
                                      email: email!,
                                      phone: phone!,
                                      password: password!,
                                      confirmPassword: confirmPassword!,
                                      context: context,
                                    );
                                  }
                                }),
                          SizedBox(height: 3.h),
                          Text(
                            "Or",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12.2.sp,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          DefaultButton(
                            bgColor: AppColors.whiteColor,
                            text: 'Report A Problem',
                            textColor: AppColors.blackColorPlayed,
                            fontSize: 14.sp,
                            size: Size(90.w, 6.8.h),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, 'reportAProblemScreen');
                            },
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'having a problem ?',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(width: 0.5.h),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'reportAProblemScreen');
                                },
                                child: Text(
                                  ' contact help desk',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12.2.sp,
                                  ),
                                ),
                              ),
                            ],
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
      },
    );
  }
}
