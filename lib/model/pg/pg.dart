// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';
part 'pg.g.dart';

@JsonSerializable()
class PG_details {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "place")
  String? place;

  @JsonKey(name: "room")
  int? room;

  PG_details({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.place,
    this.price,
    this.room,
  });

  factory PG_details.fromJson(Map<String, dynamic> json) =>
      _$PG_detailsFromJson(json);
  Map<String, dynamic> toJson() => _$PG_detailsToJson(this);
}
