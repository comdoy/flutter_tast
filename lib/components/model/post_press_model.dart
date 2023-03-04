// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PostPressModel postPressFromJson(String str) =>
    PostPressModel.fromJson(json.decode(str));

String postPressToJson(PostPressModel data) => json.encode(data.toJson());

class PostPressModel {
  PostPressModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  String code;
  String msg;
  PressItem data;

  factory PostPressModel.fromJson(Map<String, dynamic> json) => PostPressModel(
        code: json["code"],
        msg: json["msg"],
        data: PressItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
      };
}

class PressItem {
  PressItem({
    this.id,
    this.userId,
    this.typeId,
    this.userImage,
    this.pressName,
    this.pressImage,
    this.pressTitle,
    this.pressText,
    this.pressTime,
  });

  int? id;
  int? userId;
  int? typeId;
  String? userImage;
  String? pressName;
  String? pressImage;
  String? pressTitle;
  String? pressText;
  DateTime? pressTime;

  factory PressItem.fromJson(Map<String, dynamic> json) => PressItem(
        id: json["id"],
        userId: json["user_id"],
        typeId: json["type_id"],
        userImage: json["user_image"],
        pressName: json["press_name"],
        pressImage: json["press_image"],
        pressTitle: json["press_title"],
        pressText: json["press_text"],
        pressTime: DateTime.parse(json["press_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type_id": typeId,
        "user_image": userImage,
        "press_name": pressName,
        "press_image": pressImage,
        "press_title": pressTitle,
        "press_text": pressText,
        "press_time":
            "${pressTime?.year.toString().padLeft(4, '0')}-${pressTime?.month.toString().padLeft(2, '0')}-${pressTime?.day.toString().padLeft(2, '0')}",
      };
}
