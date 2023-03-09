import 'package:json_annotation/json_annotation.dart';

part 'menu_api_response_model.g.dart';

@JsonSerializable()
class MenuAPIResponseModel {
  String? status;
  dynamic data;

  MenuAPIResponseModel({
    this.status,
    this.data,
  });

  factory MenuAPIResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MenuAPIResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuAPIResponseModelToJson(this);
}
