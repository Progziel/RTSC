// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      roll_no: json['roll_no'] as int?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'roll_no': instance.roll_no,
    };
