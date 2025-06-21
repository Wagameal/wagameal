import 'package:json_annotation/json_annotation.dart';
part 'RequestLogin.g.dart';

@JsonSerializable()
class RequestLogin {

  @JsonKey(name: "mobile")
  String? mobile;

  @JsonKey(name: "otp")
  String? otp;

  RequestLogin();
  static const fromJsonFactory=_$RequestLoginFromJson;
  factory RequestLogin.fromJson(Map<String,dynamic>json)=>_$RequestLoginFromJson(json);
  Map<String,dynamic> toJson()=>_$RequestLoginToJson(this);

}





