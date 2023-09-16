// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_image_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileImageBodyModel _$SetProfileImageBodyModelFromJson(
        Map<String, dynamic> json) =>
    SetProfileImageBodyModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
    )..errors = json['errors'] == null
        ? null
        : ImageErrors.fromJson(json['errors'] as Map<String, dynamic>);

Map<String, dynamic> _$SetProfileImageBodyModelToJson(
        SetProfileImageBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ImageErrors _$ImageErrorsFromJson(Map<String, dynamic> json) => ImageErrors(
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImageErrorsToJson(ImageErrors instance) =>
    <String, dynamic>{
      'image': instance.image,
    };
