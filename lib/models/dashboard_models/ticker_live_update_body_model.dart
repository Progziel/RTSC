
import 'package:json_annotation/json_annotation.dart';
part 'ticker_live_update_body_model.g.dart';

@JsonSerializable()
class LiveUpdateBodyModel {
  int? status;
  String? message;
  List<LiveUpdateModel>? data;


  LiveUpdateBodyModel({this.data,this.status,this.message});

  factory LiveUpdateBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LiveUpdateBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveUpdateBodyModelToJson(this);
}

@JsonSerializable()
class LiveUpdateModel {
  int? matchLogId;
  String? matchLogCategoriesID;
  int? matchLogPlayerID1;
  int? matchLogPlayerID2;
  int? matchLogVenuesID;
  String? matchLogPlayer1Score;
  String? matchLogPlayer2Score;
  String? time;
  String? day;
  String? date;
  String? status;
  String? player1Name;
  String? player1WeightClass;
  String? player1CountryName;
  String? player1CountryFlag;
  String? player1Image;
  String? player1TeamName;
  String? player2Name;
  String? player2WeightClass;
  String? player2CountryName;
  String? player2CountryFlag;
  String? player2Image;
  String? Player2TeamName;
  String? VenuesName;
  String? VenuesLocation;
  String? VenuesCapacity;
  int? update_id;
  String? update_text;

  LiveUpdateModel(
      {this.matchLogId,
        this.matchLogCategoriesID,
        this.matchLogPlayerID1,
        this.matchLogPlayerID2,
        this.matchLogVenuesID,
        this.matchLogPlayer1Score,
        this.matchLogPlayer2Score,
        this.time,
        this.day,
        this.date,
        this.status,
        this.player1Name,
        this.player1WeightClass,
        this.player1CountryName,
        this.player1CountryFlag,
        this.player1Image,
        this.player1TeamName,
        this.player2Name,
        this.player2WeightClass,
        this.player2CountryName,
        this.player2CountryFlag,
        this.player2Image,
        this.Player2TeamName,
        this.VenuesLocation,
        this.VenuesName,
        this.VenuesCapacity,
        this.update_text,
        this.update_id});

  factory LiveUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$LiveUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveUpdateModelToJson(this);
}