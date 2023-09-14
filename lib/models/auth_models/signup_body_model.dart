import 'package:json_annotation/json_annotation.dart';
part 'signup_body_model.g.dart';

@JsonSerializable()
class SignupBodyModel {
  Data? data;
  String? message;
  int? status;
  SignupBodyModel({this.status,this.data,this.message});

  factory SignupBodyModel.fromJson(Map<String, dynamic> json) => _$SignupBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupBodyModelToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? name;
  String? email;
  String? rollNo;

  Data({this.name,this.email,this.id,this.rollNo});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}