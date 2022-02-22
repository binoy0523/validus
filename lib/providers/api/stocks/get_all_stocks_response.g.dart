// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_stocks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStocksResponse _$GetAllStocksResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllStocksResponse(
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int,
      stocks: (json['data'] as List<dynamic>)
          .map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllStocksResponseToJson(
        GetAllStocksResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'data': instance.stocks,
    };
