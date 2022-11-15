import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<NotificationList> data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        code: json["code"],
        message: json["message"],
        data: List<NotificationList>.from(
            json["data"].map((x) => NotificationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NotificationList {
  NotificationList({
    required this.id,
    required this.email,
    required this.picture,
    required this.name,
  });

  String id;
  String email;
  String picture;
  String name;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json["_id"],
        email: json["email"],
        picture: json["picture"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "picture": picture,
        "name": name,
      };
}
