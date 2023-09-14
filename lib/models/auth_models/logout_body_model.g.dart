// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutBodyModel _$LogoutBodyModelFromJson(Map<String, dynamic> json) =>
    LogoutBodyModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$LogoutBodyModelToJson(LogoutBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
