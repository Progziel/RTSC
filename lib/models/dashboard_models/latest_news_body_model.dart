
import 'package:json_annotation/json_annotation.dart';

part 'latest_news_body_model.g.dart';

@JsonSerializable()
class LatestNewsBodyModel {
  int? status;
  String? message;
  List<LatestNewsData>? data;


  LatestNewsBodyModel({
    this.status,
    this.message,
    this.data,
  });

  factory LatestNewsBodyModel.fromJson(Map<String, dynamic> json) => _$LatestNewsBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LatestNewsBodyModelToJson(this);
}

@JsonSerializable()
class LatestNewsData {
  int? id;
  String? news_name;
  String? image;
  String? title;
  String? article;
  String? status;
  String? created_at;
  String? updated_at;
  String? date;

  LatestNewsData(
      {this.id,this.image,this.status,this.date,this.created_at,this.updated_at,this.title,this.article,this.news_name});

  factory LatestNewsData.fromJson(Map<String, dynamic> json) => _$LatestNewsDataFromJson(json);
  Map<String, dynamic> toJson() => _$LatestNewsDataToJson(this);
}

