
import 'package:json_annotation/json_annotation.dart';
part 'search_filter_model.g.dart';

@JsonSerializable()
class SearchFilterModel {
  String? categories;
  SearchFilterModel({this.categories});

  factory SearchFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterModelToJson(this);
}