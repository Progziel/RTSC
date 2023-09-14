import 'package:json_annotation/json_annotation.dart';

part 'update_profile_model.g.dart';

@JsonSerializable()
class UpdateProfileModel{
  String? first_name;
  String? last_name;
  String? address;


  UpdateProfileModel({this.first_name, this.last_name,this.address});


  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdateProfileModelToJson(this);
}
