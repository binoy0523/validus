import 'package:json_annotation/json_annotation.dart';
import 'package:validus_coin/providers/api/model/base_response.dart';
import 'package:validus_coin/providers/api/stocks/stock.dart';

part 'get_all_stocks_response.g.dart';

/// Response from the server when requesting a savings goal.
@JsonSerializable()
class GetAllStocksResponse extends BaseResponse {
  /// Create a new get all savings goals request.
  GetAllStocksResponse({
    required bool success,
    required int statusCode,
    required this.stocks,
  }) : super(success: success, statusCode: statusCode);

  /// Converts json to model
  factory GetAllStocksResponse.fromJson(Map<String, dynamic> json) => _$GetAllStocksResponseFromJson(json);

  /// inner accounts object
  @JsonKey(name: 'data')
  final List<Stock> stocks;

  /// Converts model to json
  @override
  Map<String, dynamic> toJson() => _$GetAllStocksResponseToJson(this);
}
