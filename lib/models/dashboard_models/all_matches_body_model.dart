import 'package:json_annotation/json_annotation.dart';
part 'all_matches_body_model.g.dart';

@JsonSerializable()
class AllMatchesBodyModel {
  int? status;
  String? message;
  List<AllMatchesModel>? data;

  AllMatchesBodyModel({
    this.status,
    this.message,
    this.data,
  });

  factory AllMatchesBodyModel.fromJson(Map<String, dynamic> json) =>
      _$AllMatchesBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllMatchesBodyModelToJson(this);
}

@JsonSerializable()
class AllMatchesModel {
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
  String? player2Name;
  String? player2WeightClass;
  String? player2CountryName;
  String? player2CountryFlag;
  String? player2Image;
  String? Player1Age;
  String? Player2Age;
  String? Player1Height;
  String? Player2Height;
  String? Player1TeamName;
  String? Player2TeamName;
  String? VenuesName;
  String? VenuesLocation;
  String? VenuesCapacity;

  AllMatchesModel(
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
      this.Player1TeamName,
      this.player2Name,
      this.player2WeightClass,
      this.player2CountryName,
      this.player2CountryFlag,
      this.player2Image,
      this.Player2TeamName,
      this.VenuesName,
      this.VenuesLocation,
      this.VenuesCapacity,this.Player1Age,this.Player1Height,this.Player2Age,this.Player2Height});

  factory AllMatchesModel.fromJson(Map<String, dynamic> json) =>
      _$AllMatchesModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllMatchesModelToJson(this);
}
