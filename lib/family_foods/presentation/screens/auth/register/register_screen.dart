// ignore_for_file: depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/auth/register-cubit/register_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
          Navigator.pushReplacementNamed(
            context,
            'loginScreen',
          );
        }
      },
      builder: (context, state) {
        RegisterCubit registerCubit = RegisterCubit.get(context);
        return StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
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
                        body: Form(
                          key: registerKey,
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
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
                              Container(
                                height: 15.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.mainLogoPng),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                'Become part of the family.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
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
                                          return 'Please Password is Week';
                                        }
                                      },
                                    ),
                                    SizedBox(height: 2.5.h),
                                    DefaultTextFormField(
                                      check: true,
                                      isObscureText: !isPassword,
                                      hintText: 'Confitm Password',
                                      imagePreffixIcon:
                                          AppAssets.passwordIconPng,
                                      imageSuffixIcon: AppAssets.eyeIconPng,
                                      textEditingController:
                                          confirmPasswordController,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Your Confirm Password';
                                        } else if (value.length < 3) {
                                          return 'Please Confirm Password is Week';
                                        } else if (password !=
                                            confirmPassword) {
                                          return "Confirm Password is'nt Similar Password";
                                        }
                                      },
                                      // onChanged: (value) {
                                      //   confirmPassword = value;
                                      // },
                                    ),
                                    SizedBox(height: 2.5.h),
                                    DefaultTextFormField(
                                      isObscureText: isPassword,
                                      hintText: 'Phone Number',
                                      imagePreffixIcon:
                                          AppAssets.passwordIconPng,
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
                                      // onChanged: (value) {
                                      //   phone = value;
                                      // },
                                    ),
                                    SizedBox(height: 3.8.h),
                                    if (state is RegisterLoadingState)
                                      Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    if (state is! RegisterLoadingState)
                                      DefaultButton(
                                          bgColor: AppColors.primaryColor,
                                          text: 'Signup',
                                          textColor: AppColors.whiteColor,
                                          fontSize: 13.sp,
                                          size: Size(90.w, 6.8.h),
                                          onPressed: () async {
                                            if (registerKey.currentState!
                                                .validate()) {
                                              await registerCubit.signup(
                                                username:
                                                    userNameController.text,
                                                email: emailController.text,
                                                phone: phoneController.text,
                                                password:
                                                    passwordController.text,
                                                confirmPassword:
                                                    confirmPasswordController
                                                        .text,
                                                context: context,
                                              );
                                              if (state
                                                  is RegisterSuccessState) {
                                                userNameController.clear();
                                                emailController.clear();
                                                passwordController.clear();
                                                confirmPasswordController
                                                    .clear();
                                                phoneController.clear();
                                              }
                                            }
                                          }),
                                    SizedBox(height: 3.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'having a problem ?',
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            userNameController.clear();
                                            emailController.clear();
                                            passwordController.clear();
                                            confirmPasswordController.clear();
                                            phoneController.clear();
                                            Navigator.pushNamed(
                                              context,
                                              'reportAProblemScreen',
                                            );
                                          },
                                          child: Text(
                                            'contact help desk',
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
      },
    );
  }
}
