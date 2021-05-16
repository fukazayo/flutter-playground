import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'entity/TickerResponse.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: "https://coincheck.com")
abstract class ApiClient {
  static getClient() {
    final dio = Dio();
    final ApiClient apiClient = ApiClient(dio);

    return apiClient;
  }

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/api/ticker")
  Future<TickerResponse> getTicker();
}
