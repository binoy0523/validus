import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// Response object received from server when an error occurs.
@JsonSerializable()
class BaseResponse {
  /// Main constructor with it's params
  BaseResponse({
    required this.success,
    this.statusCode,
  });

  /// Converts json to model
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  /// Indicates status code of this request
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  /// Indicates whether this request was successful
  @JsonKey(name: 'success')
  final bool success;

  /// Converts model to json
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
