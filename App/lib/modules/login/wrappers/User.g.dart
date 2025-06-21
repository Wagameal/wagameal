// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['_id'] as String?
  ..name = json['name'] as String?
  ..mobile = json['mobile'] as String?
  ..email = json['email'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
    };
