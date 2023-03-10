// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/constants_methods/constant_methods.dart';
import 'package:graduation_project/family_foods/business_logic/report/report_cubit.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_button.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_text_form_field_for_problems.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_assets.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';
import 'package:graduation_project/family_foods/presentation/widgets/default_appbar_in_auth.dart';
import 'package:connectivity/connectivity.dart';

class ReportAProblemScreen extends StatelessWidget {
  // TextEditingController? nameController;
  // TextEditingController? positionController;
  // TextEditingController? explainYourProblemController;

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController positionController = TextEditingController();

  TextEditingController explainYourProblemController = TextEditingController();

  GlobalKey<FormState> reportKey = GlobalKey<FormState>();

  ReportAProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        if (state is ReportErrorState) {
          flutterToast(
            msg: 'Report in Failer',
            color: AppColors.primaryColor,
          );
        } else if (state is ReportSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            'submittedReportScreen',
          );
        }
      },
      builder: (context, state) {
        ReportCubit reportCubit = ReportCubit.get(context);
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
                    // appBar: PreferredSize(
                    //   preferredSize: Size.fromHeight(7.h),
                    //   child: const DefaultAppBarInAuth(),
                    // ),
                    body: Form(
                      key: reportKey,
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
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Report A Problem',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                DefaultTextFormFieldForProblem(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Name';
                                    } else if (value.length < 3) {
                                      return 'Please Enter Valid Name';
                                    }
                                  },
                                  // onChanged: (value) {
                                  //   name = value;
                                  // },
                                  textEditingController: nameController,
                                  textInputType: TextInputType.text,
                                  hintText: 'Name', maxLines: 1,
                                  // maxLines: 1,
                                ),
                                SizedBox(height: 5.h),
                                DefaultTextFormFieldForProblem(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Phone';
                                    }
                                  },
                                  // onChanged: (value) {
                                  //   phone = value;
                                  // },
                                  // textEditingController: positionController!,
                                  textInputType: TextInputType.number,
                                  hintText: 'Phone',
                                  textEditingController: phoneController,
                                  maxLines: 1,
                                  // maxLines: 1,
                                ),
                                SizedBox(height: 5.h),
                                DefaultTextFormFieldForProblem(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Position';
                                    }
                                  },
                                  // onChanged: (value) {
                                  //   position = value;
                                  // },
                                  textEditingController: positionController,
                                  textInputType: TextInputType.text,
                                  hintText: 'Position', maxLines: 1,
                                  // maxLines: 1,
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Explain your problem',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.5.h),
                                DefaultTextFormFieldForProblem(
                                  validator: (value) {
                                    if (value.isEmpty || value.length <= 11) {
                                      return 'Please Explain Your Problem';
                                    }
                                  },
                                  textEditingController:
                                      explainYourProblemController,
                                  // onChanged: (value) {
                                  //   message = value;
                                  // },
                                  // textEditingController: explainYourProblemController!,
                                  textInputType: TextInputType.text,
                                  hintText: 'Explain your problem here ...',
                                  maxLines: 6,
                                ),
                                SizedBox(height: 8.h),
                                if (state is ReportLoadingState)
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                if (state is! ReportLoadingState)
                                  DefaultButton(
                                    bgColor: AppColors.primaryColor,
                                    text: 'Submit',
                                    textColor: AppColors.whiteColor,
                                    fontSize: 13.sp,
                                    size: Size(90.w, 6.8.h),
                                    onPressed: () {
                                      if (reportKey.currentState!.validate()) {
                                        reportCubit.report(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          position: positionController.text,
                                          message:
                                              explainYourProblemController.text,
                                          context: context,
                                        );
                                      }
                                    },
                                  ),
                                SizedBox(height: 5.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
