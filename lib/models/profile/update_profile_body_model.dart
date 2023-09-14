
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_body_model.g.dart';

@JsonSerializable()
class UpdateProfileBodyModel{
  int? status;
  String? message;
  ProfileErrors? errors;
  UpdateProfileBodyModel({this.status, this.message, this.errors});


  factory UpdateProfileBodyModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileBodyModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdateProfileBodyModelToJson(this);
}


@JsonSerializable()
class ProfileErrors {
  List<String>? firstName;
  List<String>? lastName;
  List<String>? email;
  List<String>? password;
  List<String>? rollNo;
  List<String>? phone;


  ProfileErrors(
      {this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rollNo,
        this.phone});

  factory ProfileErrors.fromJson(Map<String, dynamic> json) => _$ProfileErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileErrorsToJson(this);
}
