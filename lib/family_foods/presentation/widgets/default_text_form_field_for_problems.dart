// ignore_for_file: must_be_immutable, duplicate_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultTextFormFieldForProblem extends StatefulWidget {
  Function validator;
  Function onChanged;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final int maxLines;

  DefaultTextFormFieldForProblem({
    Key? key,
    required this.validator,
    required this.onChanged,
    this.textEditingController,
    required this.textInputType,
    required this.hintText, required this.maxLines,
  }) : super(key: key);

  @override
  State<DefaultTextFormFieldForProblem> createState() => _DefaultTextFormFieldForProblemState();
}

class _DefaultTextFormFieldForProblemState extends State<DefaultTextFormFieldForProblem> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validator(value),
      onChanged: (value) => widget.onChanged(value),
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      obscureText: false,
      cursorColor: AppColors.blackColorPlayed,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey2ColorPlayed,
        hintText: widget.hintText,
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
  }
}
