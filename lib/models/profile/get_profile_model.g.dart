// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileBodyModel _$GetProfileBodyModelFromJson(Map<String, dynamic> json) =>
    GetProfileBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : ProfileData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileBodyModelToJson(
        GetProfileBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      id: json['id'] as int?,
      first_name: json['first_name'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      password: json['password'] as String?,
      remember_token: json['remember_token'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      roll_no: json['roll_no'] as int?,
      image: json['image'] as String?,
      last_name: json['last_name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'password': instance.password,
      'remember_token': instance.remember_token,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'roll_no': instance.roll_no,
      'image': instance.image,
      'last_name': instance.last_name,
      'phone': instance.phone,
      'address': instance.address,
    };
