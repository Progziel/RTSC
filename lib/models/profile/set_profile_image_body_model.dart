import 'package:json_annotation/json_annotation.dart';
part 'set_profile_image_body_model.g.dart';


@JsonSerializable()
class SetProfileImageBodyModel {
  int? status;
  String? message;
  ImageErrors? errors;


  SetProfileImageBodyModel({this.message,this.status});

  factory SetProfileImageBodyModel.fromJson(Map<String, dynamic> json) => _$SetProfileImageBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$SetProfileImageBodyModelToJson(this);
}


@JsonSerializable()
class ImageErrors {
  List<String>? image;


  ImageErrors({this.image});

  factory ImageErrors.fromJson(Map<String, dynamic> json) => _$ImageErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ImageErrorsToJson(this);
}
