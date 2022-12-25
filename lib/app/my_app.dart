// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login/login_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/register/register_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/layout_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/report/report_cubit.dart';
import 'package:graduation_project/family_foods/presentation/modules/layout/layout_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/forget-password/create_new_password.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/forget-password/send_password.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/forget-password/send_six_digits.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/login/login_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/register/register_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/check/check_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/report/report_aproblem_sreen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/report/submitted_report_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

class FamilyFoods extends StatelessWidget {
  final String token;
  RouteSettings? settings;

  FamilyFoods({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => ReportCubit(),
            ),
            BlocProvider(
              create: (context) => ForgetPasswordCubit(),
            ),
            BlocProvider(
              create: (context) => LayoutCubit(),
            ),
          ],
          child: MaterialApp(
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(token: token),
              CheckScreen.routeName: (context) => const CheckScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              ReportAProblemScreen.routeName: (context) =>
                  ReportAProblemScreen(),
              SubmittedReportScreen.routeName: (context) =>
                  const SubmittedReportScreen(),
              SendPasswordScreen.routeName: (context) => SendPasswordScreen(),
              SendSixDigits.routeName: (context) => SendSixDigits(),
              CreateNewPasswordScreen.routeName: (context) =>
                  CreateNewPasswordScreen(),
              LayoutScreen.routeName: (context) => LayoutScreen(),
            },
          ),
        );
      },
    );
  }
}
