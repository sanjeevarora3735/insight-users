import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:insight_users/api/client/rest_client.dart';
import '../tool/build_variant_def.dart';
import '../tool/logging_interceptor.dart';
import '../tool/token_interceptor.dart';

RestClient getApiClient() {
  return RestClient(
      _addInterceptors(Dio(BaseOptions(
        contentType: "application/json",
      ))),
      baseUrl: BuildVariant.baseUrl);
}

Dio _addInterceptors(Dio dio) {
  if (kReleaseMode) {
    dio.interceptors.add(TokenInterceptor());
  } else {
    dio.interceptors.addAll([LoggingInterceptor(), TokenInterceptor()]);
  }
  return dio;
}


