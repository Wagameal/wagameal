import 'package:json_annotation/json_annotation.dart';
part 'Banners.g.dart';

@JsonSerializable()
class Banners {

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "image")
  String? imageLink;

  @JsonKey(name: "isActive")
  bool? isActive;

  Banners();
  static const fromJsonFactory=_$BannersFromJson;
  factory Banners.fromJson(Map<String,dynamic>json)=>_$BannersFromJson(json);
  Map<String,dynamic> toJson()=>_$BannersToJson(this);

}





