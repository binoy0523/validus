import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:validus_coin/providers/api/stocks/get_all_stocks_response.dart';

part 'stocks_api.g.dart';

/// API that responsible for retrieving stocks.
@RestApi()
abstract class StocksApi {
  /// Factory constructor using Retrofit to create service. Uses a Dio instance [dio] for HTTP client.
  ///
  /// [dio] Is required and should not be null. Base URL from [dio] is used by default.
  /// Optionally accepts [baseUrl] to override the base URL of the Dio instance.
  factory StocksApi(Dio dio, {String baseUrl}) = _StocksApi;

  /// Get all the stocks for a user
  @GET("")
  Future<GetAllStocksResponse> getAllStocks();

}
