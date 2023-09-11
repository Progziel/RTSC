// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupBodyModel _$SignupBodyModelFromJson(Map<String, dynamic> json) =>
    SignupBodyModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignupBodyModelToJson(SignupBodyModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      email: json['email'] as String?,
      userId: json['userId'] as String?,
      rollNo: json['rollNo'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'rollNo': instance.rollNo,
    };
