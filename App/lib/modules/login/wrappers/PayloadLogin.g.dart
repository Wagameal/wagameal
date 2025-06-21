// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadLogin _$PayloadLoginFromJson(Map<String, dynamic> json) => PayloadLogin()
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..token = json['token'] as String?;

Map<String, dynamic> _$PayloadLoginToJson(PayloadLogin instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
