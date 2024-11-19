import 'package:dio/dio.dart';
import 'package:insight_users/model/users_info.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/api_endpoints.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @GET(ApiEndpoints.getUsersInfo)
  Future<List<User>> getUsersInfo();
}
