// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants/constants.dart';
import 'package:graduation_project/core/utils/app_routes.dart';
import 'package:sizer/sizer.dart';

class FamilyFoods extends StatelessWidget {

  const FamilyFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: cubits,
          child: const MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: 'splashScreen',
          ),
        );
      },
    );
  }
}
