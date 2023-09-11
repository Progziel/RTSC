import 'package:json_annotation/json_annotation.dart';
part 'signup_model.g.dart';


@JsonSerializable()
class SignupModel {
  String? email;
  String? password;
  String? first_name;
  String? last_name;
  int? roll_no;

  SignupModel({this.password,this.email,this.first_name,this.last_name,this.roll_no});

  factory SignupModel.fromJson(Map<String, dynamic> json) => _$SignupModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}