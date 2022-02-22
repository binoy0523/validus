import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

/// The model for a stock received in the response.
@JsonSerializable()
class Stock {
  Stock({
    required this.id,
    required this.stockName,
    required this.price,
    required this.dayGain,
    required this.lastTrade,
    required this.extendedHours,
    required this.lastPrice,
  });

  /// Converts json to model
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  /// The id of the stock
  @JsonKey(name: 'id')
  String id;

  /// The name of the stock
  @JsonKey(name: 'stockName')
  String stockName;

  /// The price of the stock
  @JsonKey(name: 'price')
  double price;

  /// The gain of the stock
  @JsonKey(name: 'dayGain')
  double dayGain;

  /// The last trade time of the stock
  @JsonKey(name: 'lastTrade')
  String lastTrade;

  /// The extended time of the stock
  @JsonKey(name: 'extendedHours')
  String extendedHours;

  /// The last price of the stock
  @JsonKey(name: 'lastPrice')
  double lastPrice;

  double get percentageChange {
    return (((price - lastPrice) / lastPrice) * 100);
  }

  /// Converts model to json
  Map<String, dynamic> toJson() => _$StockToJson(this);
}
