// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login-cubit/login_cubit.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultTextFormField extends StatelessWidget {
  Function validator;
  Function onChanged;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final String imagePreffixIcon;
  final String? imageSuffixIcon;
  final String hintText;
  bool isPasswordField;
  bool isObscureText;

  bool check;

  DefaultTextFormField({
    Key? key,
    required this.validator,
    required this.onChanged,
    this.textEditingController,
    required this.textInputType,
    required this.imagePreffixIcon,
    required this.imageSuffixIcon,
    required this.hintText,
    this.isPasswordField = false,
    this.isObscureText = true,
    this.check = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return TextFormField(
          validator: (value) => validator(value),
          onChanged: (value) => onChanged(value),
          controller: textEditingController,
          keyboardType: textInputType,
          obscureText: isPasswordField == true
              ? !cubit.visiblePassword
              : check == true
                  ? !cubit.pass
                  : false,
          cursorColor: AppColors.blackColorPlayed,
          decoration: InputDecoration(
            prefixIcon: Image.asset(
              imagePreffixIcon,
              color: AppColors.blackColor,
            ),
            suffixIcon: isPasswordField
                ? IconButton(
                    icon: Icon(
                      (cubit.visiblePassword)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    color: AppColors.blackColorPlayed,
                    iconSize: 15.sp,
                    onPressed: () {
                      check == true
                          ? cubit.changePasswordVisibityForRegister()
                          : cubit.changePasswordVisibity();
                    },
                  )
                : check == true
                    ? IconButton(
                        icon: Icon(
                          (cubit.pass)
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        color: AppColors.blackColorPlayed,
                        iconSize: 15.sp,
                        onPressed: () {
                          check == true
                              ? cubit.changePasswordVisibityForRegister()
                              : cubit.changePasswordVisibity();
                        },
                      )
                    : const SizedBox(),
            filled: true,
            fillColor: AppColors.grey2ColorPlayed,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey2ColorPlayed,
              ),
              borderRadius: BorderRadius.circular(50.0.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey2ColorPlayed,
              ),
              borderRadius: BorderRadius.circular(50.0.sp),
            ),
          ),
        );
      },
    );
  }
}
