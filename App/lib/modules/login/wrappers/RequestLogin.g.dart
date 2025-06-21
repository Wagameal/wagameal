// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) => RequestLogin()
  ..mobile = json['mobile'] as String?
  ..otp = json['otp'] as String?;

Map<String, dynamic> _$RequestLoginToJson(RequestLogin instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'otp': instance.otp,
    };
