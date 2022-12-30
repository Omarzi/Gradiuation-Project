// ignore_for_file: depend_on_referenced_packages, implementation_imports, unnecessary_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:graduation_project/family_foods/business_logic/auth/forget-password-cubit/forget_password_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/login-cubit/login_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/auth/register-cubit/register_cubit.dart';
import 'package:graduation_project/family_foods/business_logic/layout/cubit/get_all_products/get_all_products_cubit.dart';
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
  BlocProvider(
    create: (context) => GetAllProductsCubit()..getAllProducts(context: context),
  ),
];

// End Cubits //
//----------------------//
