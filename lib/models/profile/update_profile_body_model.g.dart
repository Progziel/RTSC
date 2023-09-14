// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileBodyModel _$UpdateProfileBodyModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : ProfileErrors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileBodyModelToJson(
        UpdateProfileBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ProfileErrors _$ProfileErrorsFromJson(Map<String, dynamic> json) =>
    ProfileErrors(
      firstName: (json['firstName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastName: (json['lastName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rollNo:
          (json['rollNo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProfileErrorsToJson(ProfileErrors instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'rollNo': instance.rollNo,
      'phone': instance.phone,
    };
