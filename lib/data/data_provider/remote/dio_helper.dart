// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages, dead_code, unused_catch_clause, avoid_print, use_build_context_synchronously
// Dio Helper That's Connect and Talk to API.
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/end_points.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';

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
      } else if (response.statusCode == 403){
          print(response.data);
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

  static void logout(BuildContext context) async {
    await MyCache.clearShared();
    Navigator.pushReplacementNamed(context, 'checkScreen');
  }
}
