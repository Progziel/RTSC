
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  String id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? profilePicture;

  UserModel({
    required this.id,
    this.firstName, this.lastName, this.email, this.phone,this.profilePicture
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}