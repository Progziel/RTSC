
import 'package:json_annotation/json_annotation.dart';

part 'live_matches_model.g.dart';

@JsonSerializable()
class LiveMatchesModel{
  String? id;

  LiveMatchesModel({
    this.id
  });

  factory LiveMatchesModel.fromJson(Map<String, dynamic> json) => _$LiveMatchesModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveMatchesModelToJson(this);
}
