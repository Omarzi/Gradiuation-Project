// ignore_for_file: depend_on_referenced_packages, implementation_imports, unnecessary_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login/login_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/register/register_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/layout_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/report/report_cubit.dart';

//----------------------//
// Start Base Images //

const String baseImage = 'assets/images/';

// End Base Images //
//----------------------//


//----------------------//
// Start Cubits //

List<BlocProviderSingleChildWidget> cubits = [
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
];

// End Cubits //
//----------------------//
