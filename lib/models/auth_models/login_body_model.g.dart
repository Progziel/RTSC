// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBodyModel _$LoginBodyModelFromJson(Map<String, dynamic> json) =>
    LoginBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LoginBodyModelToJson(LoginBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
    };
