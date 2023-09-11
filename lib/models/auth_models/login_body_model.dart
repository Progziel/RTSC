import 'package:boxing/models/auth_models/signup_body_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_body_model.g.dart';


@JsonSerializable()
class LoginBodyModel {
  int? status;
  String? message;
  String? id;

  LoginBodyModel({this.status,this.message,this.id});

  factory LoginBodyModel.fromJson(Map<String, dynamic> json) => _$LoginBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginBodyModelToJson(this);
}