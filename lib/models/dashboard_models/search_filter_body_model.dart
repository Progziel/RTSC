import 'package:json_annotation/json_annotation.dart';

part 'search_filter_body_model.g.dart';

@JsonSerializable()
class SearchFilerBodyModel {
  int? status;
  String? message;
  List<SearchListData>? data;
  SearchFilerBodyModel({this.message, this.status, this.data});

  factory SearchFilerBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFilerBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilerBodyModelToJson(this);
}

@JsonSerializable()
class SearchListData {
  int? id;
  String? t1_image;
  int? t1_score;
  String? date;
  String? t1_countryname;
  String? t1_countryflag;
  String? status;
  String? created_at;
  String? updated_at;
  String? t1_team_name;
  String? t2_image;
  int? t2_score;
  String? t2_countryname;
  String? t2_countryflag;
  String? t2_team_name;
  String? categories;
  String? day;
  String? time;
  SearchListData(
      {this.status,
      this.updated_at,
      this.created_at,
      this.time,
      this.date,
      this.t1_score,
      this.t2_image,
      this.t1_team_name,
      this.t1_image,
      this.t2_team_name,
      this.t2_score,
      this.id,
      this.day,
      this.categories,
      this.t1_countryflag,
      this.t1_countryname,
      this.t2_countryflag,
      this.t2_countryname});

  factory SearchListData.fromJson(Map<String, dynamic> json) =>
      _$SearchListDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchListDataToJson(this);
}
