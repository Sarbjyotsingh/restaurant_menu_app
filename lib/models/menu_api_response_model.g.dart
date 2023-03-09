// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuAPIResponseModel _$MenuAPIResponseModelFromJson(
        Map<String, dynamic> json) =>
    MenuAPIResponseModel(
      status: json['status'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$MenuAPIResponseModelToJson(
        MenuAPIResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
