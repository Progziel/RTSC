
import 'package:json_annotation/json_annotation.dart';

part 'get_profile_model.g.dart';

@JsonSerializable()
class GetProfileBodyModel{
  int? status;
  String? message;
  ProfileData? user;


  GetProfileBodyModel({this.status, this.message, this.user});


  factory GetProfileBodyModel.fromJson(Map<String, dynamic> json) => _$GetProfileBodyModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GetProfileBodyModelToJson(this);
}


@JsonSerializable()
class ProfileData {
  int? id;
  String? first_name;
  String? email;
  String? email_verified_at;
  String? password;
  String? remember_token;
  String? created_at;
  String? updated_at;
  int? roll_no;
  String? image;
  String? last_name;
  String? phone;
  String? address;

  ProfileData(
      {this.id,
        this.first_name,
        this.email,
        this.email_verified_at,
        this.password,
        this.remember_token,
        this.created_at,
        this.updated_at,
        this.roll_no,
        this.image,
        this.last_name,
        this.phone,this.address});

  factory ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
