// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fighter_detail_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FighterDetailBodyModel _$FighterDetailBodyModelFromJson(
        Map<String, dynamic> json) =>
    FighterDetailBodyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FighterDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FighterDetailBodyModelToJson(
        FighterDetailBodyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FighterDetail _$FighterDetailFromJson(Map<String, dynamic> json) =>
    FighterDetail(
      matchLogId: json['matchLogId'] as int?,
      matchLogPlayer1Score: json['matchLogPlayer1Score'] as String?,
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
      VenuesCapacity: json['VenuesCapacity'] as String?,
      VenuesLocation: json['VenuesLocation'] as String?,
      VenuesName: json['VenuesName'] as String?,
      update_id: json['update_id'] as int?,
      update_text: json['update_text'] as String?,
    );

Map<String, dynamic> _$FighterDetailToJson(FighterDetail instance) =>
    <String, dynamic>{
      'matchLogId': instance.matchLogId,
      'matchLogPlayer1Score': instance.matchLogPlayer1Score,
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
      'VenuesName': instance.VenuesName,
      'VenuesLocation': instance.VenuesLocation,
      'VenuesCapacity': instance.VenuesCapacity,
      'update_id': instance.update_id,
      'update_text': instance.update_text,
    };
