import 'package:dio/dio.dart';

import '../../utils/log.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.removeWhere(
        (key, value) => value == null || value == "" || value == "null");

    Log("--> ${options.method.toUpperCase()}");
    Log("URL: ${options.baseUrl + options.path}");
    Log("Headers:");
    options.headers.forEach((k, v) => Log('$k: $v'));
    Log("queryParameters:");
    options.queryParameters.forEach((k, v) => Log('$k: $v'));
    if (options.data != null) {
      Log("Body: ${options.data}");
    }
    Log("--> END ${options.method.toUpperCase()}");

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log(
        "<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}");
    Log("Headers:");
    response.headers.forEach((k, v) => Log('$k: $v'));
    Log.printWrapped("Response: ${response.data}");
    Log("<-- END HTTP");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log(
        "<-- ${err.message} ${(err.requestOptions.baseUrl + err.requestOptions.path)}");
    Log(
        "${err.response != null ? err.requestOptions.data : 'Unknown Error'}");
    Log("<-- End error");

    handler.next(err);
  }
}
