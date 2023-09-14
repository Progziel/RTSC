// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_matches_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveMatchesBodyModel _$LiveMatchesBodyModelFromJson(
        Map<String, dynamic> json) =>
    LiveMatchesBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LiveMatchesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveMatchesBodyModelToJson(
        LiveMatchesBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LiveMatchesData _$LiveMatchesDataFromJson(Map<String, dynamic> json) =>
    LiveMatchesData(
      id: json['id'] as int?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      categories: json['categories'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      created_at: json['created_at'] as String?,
      t1_countryFlag: json['t1_countryFlag'] as String?,
      t1_countryName: json['t1_countryName'] as String?,
      t1_image: json['t1_image'] as String?,
      t1_score: json['t1_score'] as int?,
      t1_team_name: json['t1_team_name'] as String?,
      t2_country_flag: json['t2_country_flag'] as String?,
      t2_country_name: json['t2_country_name'] as String?,
      t2_image: json['t2_image'] as String?,
      t2_score: json['t2_score'] as int?,
      t2_team_name: json['t2_team_name'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$LiveMatchesDataToJson(LiveMatchesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      't1_image': instance.t1_image,
      't1_score': instance.t1_score,
      'date': instance.date,
      't1_countryName': instance.t1_countryName,
      't1_countryFlag': instance.t1_countryFlag,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      't1_team_name': instance.t1_team_name,
      't2_image': instance.t2_image,
      't2_score': instance.t2_score,
      't2_country_name': instance.t2_country_name,
      't2_country_flag': instance.t2_country_flag,
      't2_team_name': instance.t2_team_name,
      'categories': instance.categories,
      'day': instance.day,
      'time': instance.time,
    };
