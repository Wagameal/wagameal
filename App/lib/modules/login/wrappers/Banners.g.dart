// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners()
  ..id = json['_id'] as String?
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..imageLink = json['image'] as String?
  ..isActive = json['isActive'] as bool?;

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.imageLink,
      'isActive': instance.isActive,
    };
