// // ignore_for_file: depend_on_referenced_packages
// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages, dead_code, unused_catch_clause, avoid_print
// Dio Helper That's Connect and Talk to API.
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant_methods.dart';
import 'package:graduation_project/core/end_points.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/family_foods/presentation/styles/app_colors.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(
      baseUrl + endPoint,
      options: Options(
        headers: {
          "authorization":
              "Bearer ${MyCache.getString(key: MyCacheKeys.token)}",
        },
      ),
    );
    log(response.statusCode.toString());
    return response;
  }

  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await dio.post(
        baseUrl + endPoint,
        data: body,
      );
      print(response.data);
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  // void errorHandler(String errorBody, int? statusCode) {
  //   String message = "";
  //   if (errorBody != null) {
  //     String body = errorBody;
  //     var jsonObject = jsonDecode(body);
  //     message = jsonObject['message'];
  //     flutterToast(msg: message, color: AppColors.primaryColor);
  //   }
  // }

  // Future<Response> deleteData({
  //   required String endPoint,
  //   Map<String, dynamic>? body,
  // }) async {
  //   return await dio.delete(
  //     endPoint,
  //     queryParameters: body,
  //   );
  // }

  static void logout(BuildContext context) {
    // MyCache.clearShared();
    Navigator.pushNamedAndRemoveUntil(context, 'checkScreen', (route) => false);
    MyCache.putString(key: MyCacheKeys.token, value: '1');
  }
}
