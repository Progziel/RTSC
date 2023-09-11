// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupModel _$SignupModelFromJson(Map<String, dynamic> json) => SignupModel(
      password: json['password'] as String?,
      email: json['email'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      roll_no: json['roll_no'] as int?,
    );

Map<String, dynamic> _$SignupModelToJson(SignupModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'roll_no': instance.roll_no,
    };
