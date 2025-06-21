import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "mobile")
  String? mobile;

  @JsonKey(name: "email")
  String? email;

  User();
  static const fromJsonFactory=_$UserFromJson;
  factory User.fromJson(Map<String,dynamic>json)=>_$UserFromJson(json);
  Map<String,dynamic> toJson()=>_$UserToJson(this);

}





