// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilerBodyModel _$SearchFilerBodyModelFromJson(
        Map<String, dynamic> json) =>
    SearchFilerBodyModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchFilerBodyModelToJson(
        SearchFilerBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SearchListData _$SearchListDataFromJson(Map<String, dynamic> json) =>
    SearchListData(
      status: json['status'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      t1_score: json['t1_score'] as int?,
      t2_image: json['t2_image'] as String?,
      t1_team_name: json['t1_team_name'] as String?,
      t1_image: json['t1_image'] as String?,
      t2_team_name: json['t2_team_name'] as String?,
      t2_score: json['t2_score'] as int?,
      id: json['id'] as int?,
      day: json['day'] as String?,
      categories: json['categories'] as String?,
      t1_countryflag: json['t1_countryflag'] as String?,
      t1_countryname: json['t1_countryname'] as String?,
      t2_countryflag: json['t2_countryflag'] as String?,
      t2_countryname: json['t2_countryname'] as String?,
    );

Map<String, dynamic> _$SearchListDataToJson(SearchListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      't1_image': instance.t1_image,
      't1_score': instance.t1_score,
      'date': instance.date,
      't1_countryname': instance.t1_countryname,
      't1_countryflag': instance.t1_countryflag,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      't1_team_name': instance.t1_team_name,
      't2_image': instance.t2_image,
      't2_score': instance.t2_score,
      't2_countryname': instance.t2_countryname,
      't2_countryflag': instance.t2_countryflag,
      't2_team_name': instance.t2_team_name,
      'categories': instance.categories,
      'day': instance.day,
      'time': instance.time,
    };
