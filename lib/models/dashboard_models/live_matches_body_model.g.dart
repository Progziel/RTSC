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
      matchLogId: json['matchLogId'] as int?,
      matchLogCategoriesID: json['matchLogCategoriesID'] as String?,
      matchLogPlayerID1: json['matchLogPlayerID1'] as int?,
      matchLogPlayerID2: json['matchLogPlayerID2'] as int?,
      matchLogVenuesID: json['matchLogVenuesID'] as int?,
      matchLogPlayer1Score: json['matchLogPlayer1Score'] as String?,
      matchLogPlayer2Score: json['matchLogPlayer2Score'] as String?,
      time: json['time'] as String?,
      day: json['day'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      player1Name: json['player1Name'] as String?,
      player1WeightClass: json['player1WeightClass'] as String?,
      player1CountryName: json['player1CountryName'] as String?,
      player1CountryFlag: json['player1CountryFlag'] as String?,
      player1Image: json['player1Image'] as String?,
      Player1TeamName: json['Player1TeamName'] as String?,
      player2Name: json['player2Name'] as String?,
      player2WeightClass: json['player2WeightClass'] as String?,
      player2CountryName: json['player2CountryName'] as String?,
      player2CountryFlag: json['player2CountryFlag'] as String?,
      player2Image: json['player2Image'] as String?,
      Player2TeamName: json['Player2TeamName'] as String?,
      VenuesName: json['VenuesName'] as String?,
      VenuesLocation: json['VenuesLocation'] as String?,
      VenuesCapacity: json['VenuesCapacity'] as String?,
    )
      ..Player1Height = json['Player1Height'] as String?
      ..Player2Height = json['Player2Height'] as String?
      ..Player1Age = json['Player1Age'] as String?
      ..Player2Age = json['Player2Age'] as String?;

Map<String, dynamic> _$LiveMatchesDataToJson(LiveMatchesData instance) =>
    <String, dynamic>{
      'matchLogId': instance.matchLogId,
      'matchLogCategoriesID': instance.matchLogCategoriesID,
      'matchLogPlayerID1': instance.matchLogPlayerID1,
      'matchLogPlayerID2': instance.matchLogPlayerID2,
      'matchLogVenuesID': instance.matchLogVenuesID,
      'matchLogPlayer1Score': instance.matchLogPlayer1Score,
      'matchLogPlayer2Score': instance.matchLogPlayer2Score,
      'time': instance.time,
      'day': instance.day,
      'date': instance.date,
      'status': instance.status,
      'player1Name': instance.player1Name,
      'player1WeightClass': instance.player1WeightClass,
      'player1CountryName': instance.player1CountryName,
      'player1CountryFlag': instance.player1CountryFlag,
      'player1Image': instance.player1Image,
      'Player1TeamName': instance.Player1TeamName,
      'player2Name': instance.player2Name,
      'player2WeightClass': instance.player2WeightClass,
      'player2CountryName': instance.player2CountryName,
      'player2CountryFlag': instance.player2CountryFlag,
      'player2Image': instance.player2Image,
      'Player2TeamName': instance.Player2TeamName,
      'VenuesName': instance.VenuesName,
      'VenuesLocation': instance.VenuesLocation,
      'VenuesCapacity': instance.VenuesCapacity,
      'Player1Height': instance.Player1Height,
      'Player2Height': instance.Player2Height,
      'Player1Age': instance.Player1Age,
      'Player2Age': instance.Player2Age,
    };
