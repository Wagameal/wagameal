// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) =>
    ResponseLogin()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otp = (json['otp'] as num?)?.toInt()
      ..data = json['data'];

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otp': instance.otp,
      'data': instance.data,
    };
