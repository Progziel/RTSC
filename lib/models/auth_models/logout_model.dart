
import 'package:json_annotation/json_annotation.dart';
part 'logout_model.g.dart';


@JsonSerializable()
class LogoutModel {
  String? id;
  LogoutModel({this.id});

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}
