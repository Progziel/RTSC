// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileModel _$UpdateProfileModelFromJson(Map<String, dynamic> json) =>
    UpdateProfileModel(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateProfileModelToJson(UpdateProfileModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'address': instance.address,
    };
