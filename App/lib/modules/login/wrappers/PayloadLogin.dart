import 'package:app/modules/login/wrappers/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PayloadLogin.g.dart';

@JsonSerializable()
class PayloadLogin {

  @JsonKey(name: "user")
  User? user;

  @JsonKey(name: "token")
  String? token;

  PayloadLogin();
  static const fromJsonFactory=_$PayloadLoginFromJson;
  factory PayloadLogin.fromJson(Map<String,dynamic>json)=>_$PayloadLoginFromJson(json);
  Map<String,dynamic> toJson()=>_$PayloadLoginToJson(this);

}





