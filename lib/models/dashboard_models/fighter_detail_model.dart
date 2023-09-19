
import 'package:json_annotation/json_annotation.dart';

part 'fighter_detail_model.g.dart';

@JsonSerializable()
class FighterDetailModel {
int? matchLogPlayerId;


FighterDetailModel({
this.matchLogPlayerId
  });

  factory FighterDetailModel.fromJson(Map<String, dynamic> json) => _$FighterDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$FighterDetailModelToJson(this);
}
