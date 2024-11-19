import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../../utils/app_utils.dart';
import '../../utils/session_manager.dart';

class TokenInterceptor extends Interceptor {
  GetIt locator = GetIt.instance;
  final bool restrictActions;

  TokenInterceptor({this.restrictActions = false});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey("tokenRequired") &&
        options.headers["tokenRequired"] == true) {
      options.headers.remove("tokenRequired");
      options.headers["Authorization"] =
          "Bearer ${locator.get<SessionManager>().getToken()}";
    }
    options.queryParameters.removeWhere(
        (key, value) => value == null || value == "" || value == "null");

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!restrictActions) {
      if (err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.sendTimeout ||
          err.type == DioExceptionType.receiveTimeout) {

        AppUtils.showSnackBar(
            'Please check your internet connection and try again',
            duration: 1200);
      } else if (err.type == DioExceptionType.cancel) {

        AppUtils.showSnackBar('Something went wrong, Please contact support',
            duration: 1200);
      } else if (err.response?.statusCode == 401) {
          AppUtils.showSnackBar('Session expired, Please login again',
            duration: 1200);
      }
    }

    /// Let the error pass through
    return handler.next(err);
  }
}
