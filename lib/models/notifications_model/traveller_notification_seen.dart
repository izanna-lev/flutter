import 'dart:convert';

TravellerNotificationSeenModel travellerNotificationListFromJson(String str) =>
    TravellerNotificationSeenModel.fromJson(json.decode(str));

String travellerNotificationListToJson(TravellerNotificationSeenModel data) =>
    json.encode(data.toJson());

class TravellerNotificationSeenModel {
  TravellerNotificationSeenModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  TravellerNotificationSeenDetailsModel data;

  factory TravellerNotificationSeenModel.fromJson(Map<String, dynamic> json) =>
      TravellerNotificationSeenModel(
        code: json["code"],
        message: json["message"],
        data: TravellerNotificationSeenDetailsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class TravellerNotificationSeenDetailsModel {
  TravellerNotificationSeenDetailsModel({
    required this.id,
    required this.userRef,
    required this.text,
    required this.type,
    required this.sourceRef,
    required this.image,
    required this.notificationFrom,
    required this.seen,
    required this.createdOn,
    required this.updatedOn,
    required this.v,
  });

  String id;
  String userRef;
  String text;
  int type;
  String sourceRef;
  String image;
  String notificationFrom;
  bool seen;
  String createdOn;
  String updatedOn;
  int v;

  factory TravellerNotificationSeenDetailsModel.fromJson(
          Map<String, dynamic> json) =>
      TravellerNotificationSeenDetailsModel(
        id: json["_id"] ?? "",
        userRef: json["userRef"] ?? "",
        text: json["text"] ?? "",
        type: json["type"] ?? 0,
        sourceRef: json["sourceRef"] ?? "",
        image: json["image"] ?? "",
        notificationFrom: json["notificationFrom"] ?? "",
        seen: json["seen"] ?? false,
        createdOn: json["createdOn"] ?? "",
        updatedOn: json["updatedOn"] ?? "",
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userRef": userRef,
        "text": text,
        "type": type,
        "sourceRef": sourceRef,
        "image": image,
        "notificationFrom": notificationFrom,
        "seen": seen,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "__v": v,
      };
}
