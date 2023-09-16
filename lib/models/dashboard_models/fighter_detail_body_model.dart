
import 'package:json_annotation/json_annotation.dart';

part 'fighter_detail_body_model.g.dart';

@JsonSerializable()
class FighterDetailBodyModel {
  int? status;
  String? message;
  List<FighterDetail>? data;


  FighterDetailBodyModel({
    this.status,
    this.message,
    this.data,
  });

  factory FighterDetailBodyModel.fromJson(Map<String, dynamic> json) => _$FighterDetailBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$FighterDetailBodyModelToJson(this);
}

@JsonSerializable()
class FighterDetail {
  int? matchLogId;
  String? matchLogPlayer1Score;
  String? time;
  String? day;
  String? date;
  String? status;
  String? player1Name;
  String? player1WeightClass;
  String? player1CountryName;
  String? player1CountryFlag;
  String? player1Image;
  String? Player1TeamName;
  String? VenuesName;
  String? VenuesLocation;
  String? VenuesCapacity;
  int? update_id;
  String? update_text;

  FighterDetail(
      {this.matchLogId,
        this.matchLogPlayer1Score,
        this.time,
        this.day,
        this.date,
        this.status,
        this.player1Name,
        this.player1WeightClass,
        this.player1CountryName,
        this.player1CountryFlag,
        this.player1Image,
        this.Player1TeamName,
        this.VenuesCapacity,
        this.VenuesLocation,
        this.VenuesName,
        this.update_id,
        this.update_text});
  factory FighterDetail.fromJson(Map<String, dynamic> json) => _$FighterDetailFromJson(json);
  Map<String, dynamic> toJson() => _$FighterDetailToJson(this);
}

