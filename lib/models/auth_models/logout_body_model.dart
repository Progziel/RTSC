
import 'package:json_annotation/json_annotation.dart';
part 'logout_body_model.g.dart';


@JsonSerializable()
class LogoutBodyModel {
  int? status;
  String? message;


  LogoutBodyModel({this.message,this.status});

  factory LogoutBodyModel.fromJson(Map<String, dynamic> json) => _$LogoutBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutBodyModelToJson(this);
}
