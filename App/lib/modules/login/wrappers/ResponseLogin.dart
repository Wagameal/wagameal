
import 'package:json_annotation/json_annotation.dart';
part 'ResponseLogin.g.dart';

@JsonSerializable()
class ResponseLogin {

  @JsonKey(name:"success")
  bool? success;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"otp")
  int? otp;

  @JsonKey(name:"data")
  dynamic data;



  ResponseLogin();
  static const fromJsonFactory=_$ResponseLoginFromJson;
  factory ResponseLogin.fromJson(Map<String,dynamic> json)=>_$ResponseLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseLoginToJson(this);

}
