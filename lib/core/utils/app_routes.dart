// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graduation_project/family_foods/presentation/modules/layout/layout_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/forget-password/send_password.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/login/login_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/register/register_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/auth/report/report_aproblem_sreen.dart';
import 'package:graduation_project/family_foods/presentation/screens/check/check_screen.dart';
import 'package:graduation_project/family_foods/presentation/screens/splash_screen/splash_screen.dart';
import '../../family_foods/presentation/screens/auth/forget-password/create_new_password.dart';
import '../../family_foods/presentation/screens/auth/forget-password/send_six_digits.dart';
import '../../family_foods/presentation/screens/auth/report/submitted_report_screen.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splashScreen':
        return PageTransition(
          child: SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'checkScreen':
        return PageTransition(
          child: const CheckScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      // case 'layoutAuth':
      //   return PageTransition(
      //     child: LayoutAuthScreen(),
      //     type: PageTransitionType.fade,
      //     settings: settings,
      //     reverseDuration: const Duration(milliseconds: 200),
      //   );
      case 'loginScreen':
      return PageTransition(
        child: LoginScreen(),
        type: PageTransitionType.fade,
        settings: settings,
        reverseDuration: const Duration(milliseconds: 200),
      );
      case 'registerScreen':
        return PageTransition(
          child: RegisterScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'reportAProblemScreen':
        return PageTransition(
          child: ReportAProblemScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'submittedReportScreen':
        return PageTransition(
          child: const SubmittedReportScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'sendPasswordScreen':
        return PageTransition(
          child: SendEmailScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'sendSixDigitsScreen':
        return PageTransition(
          child: SendSixDigits(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'createNewPasswordScreen':
        return PageTransition(
          child: CreateNewPasswordScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'layoutScreen':
        return PageTransition(
          child: LayoutScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    // todo check my usage
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          // todo move this string to strings manager
          title: const Text(
            '',
          ),
        ),
        // todo move this string to strings manager
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
