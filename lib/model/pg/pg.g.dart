// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PG_details _$PG_detailsFromJson(Map<String, dynamic> json) => PG_details(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      place: json['place'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      room: json['room'] as int?,
    );

Map<String, dynamic> _$PG_detailsToJson(PG_details instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'price': instance.price,
      'place': instance.place,
      'room': instance.room,
    };
