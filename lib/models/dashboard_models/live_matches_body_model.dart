
import 'package:json_annotation/json_annotation.dart';

part 'live_matches_body_model.g.dart';

@JsonSerializable()
class LiveMatchesBodyModel {
  int? status;
  String? message;
  List<LiveMatchesData>? data;

  LiveMatchesBodyModel({
    this.status,
    this.message,
    this.data,
  });

  factory LiveMatchesBodyModel.fromJson(Map<String, dynamic> json) => _$LiveMatchesBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LiveMatchesBodyModelToJson(this);
}

@JsonSerializable()
class LiveMatchesData {
  int? id;
  String? t1_image;
  int? t1_score;
  String? date;
  String? t1_countryName;
  String? t1_countryFlag;
  String? status;
  String? created_at;
  String? updated_at;
  String? t1_team_name;
  String? t2_image;
  int? t2_score;
  String? t2_country_name;
  String? t2_country_flag;
  String? t2_team_name;
  String? categories;
  String? day;
  String? time;

  LiveMatchesData({    this.id,this.status,this.date,this.categories,this.day,
    this.time,this.created_at,this.t1_countryFlag,this.t1_countryName,this.t1_image,this.t1_score,
    this.t1_team_name,this.t2_country_flag,this.t2_country_name,this.t2_image,this.t2_score,
    this.t2_team_name,this.updated_at
  });

  factory LiveMatchesData.fromJson(Map<String, dynamic> json) => _$LiveMatchesDataFromJson(json);
  Map<String, dynamic> toJson() => _$LiveMatchesDataToJson(this);
}

