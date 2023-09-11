import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';


@JsonSerializable()
class LoginModel {
  String? email;
  String? password;
  int? roll_no;

  LoginModel({this.email,this.password,this.roll_no});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}