// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestNewsBodyModel _$LatestNewsBodyModelFromJson(Map<String, dynamic> json) =>
    LatestNewsBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LatestNewsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LatestNewsBodyModelToJson(
        LatestNewsBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LatestNewsData _$LatestNewsDataFromJson(Map<String, dynamic> json) =>
    LatestNewsData(
      id: json['id'] as int?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      title: json['title'] as String?,
      article: json['article'] as String?,
      news_name: json['news_name'] as String?,
    );

Map<String, dynamic> _$LatestNewsDataToJson(LatestNewsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_name': instance.news_name,
      'image': instance.image,
      'title': instance.title,
      'article': instance.article,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'date': instance.date,
    };
