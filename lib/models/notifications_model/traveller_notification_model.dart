import 'dart:convert';

TravellerNotificationListModel travellerNotificationListFromJson(String str) =>
    TravellerNotificationListModel.fromJson(json.decode(str));

String travellerNotificationListToJson(TravellerNotificationListModel data) =>
    json.encode(data.toJson());

class TravellerNotificationListModel {
  TravellerNotificationListModel(
      {required this.code,
      required this.message,
      required this.data,
      required this.page,
      required this.limit,
      required this.size,
      required this.hasMore,
      required this.unseenNotifications});

  int code;
  String message;
  List<TravellerDetailsNotificationList> data;
  int page;
  int limit;
  int size;
  bool hasMore;
  bool unseenNotifications;

  factory TravellerNotificationListModel.fromJson(Map<String, dynamic> json) =>
      TravellerNotificationListModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<TravellerDetailsNotificationList>.from((json["data"] ?? [])
            .map((x) => TravellerDetailsNotificationList.fromJson(x))),
        page: json["page"] ?? 0,
        limit: json["limit"] ?? 0,
        size: json["size"] ?? 0,
        hasMore: json["hasMore"] ?? false,
        unseenNotifications: json["unseenNotifications"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "size": size,
        "hasMore": hasMore,
        "unseenNotifications": unseenNotifications,
      };
}

class TravellerDetailsNotificationList {
  TravellerDetailsNotificationList({
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
    required this.userDetails,
  });

  String id;
  UserRef userRef;
  String text;
  int type;
  String sourceRef;
  String image;
  NotificationFrom notificationFrom;
  bool seen;
  DateTime createdOn;
  DateTime updatedOn;
  NotificationUserDetails userDetails;

  factory TravellerDetailsNotificationList.fromJson(
          Map<String, dynamic> json) =>
      TravellerDetailsNotificationList(
        id: json["_id"] ?? "",
        userRef: userRefValues.map[json["userRef"]] ?? UserRef.values[0],
        text: json["text"] ?? "",
        type: json["type"] ?? 0,
        sourceRef: json["sourceRef"] ?? "",
        image: json["image"] ?? "",
        notificationFrom:
            notificationFromValues.map[json["notificationFrom"]] ??
                NotificationFrom.values[0],
        seen: json["seen"] ?? false,
        createdOn:
            DateTime.parse(json["createdOn"] ?? DateTime.now().toString()),
        updatedOn:
            DateTime.parse(json["updatedOn"] ?? DateTime.now().toString()),
        userDetails: NotificationUserDetails.fromJson(json["userDetails"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userRef": userRefValues.reverse[userRef],
        "text": text,
        "type": type,
        "sourceRef": sourceRef,
        "image": image,
        "notificationFrom": notificationFromValues.reverse[notificationFrom],
        "seen": seen,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "userDetails": userDetails,
      };
}

class NotificationUserDetails {
  NotificationUserDetails({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory NotificationUserDetails.fromJson(Map<String, dynamic> json) => NotificationUserDetails(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum NotificationFrom { THE_62_F60_E8_B6_ACB2442_CA7_BAA69 }

final notificationFromValues = EnumValues({
  "62f60e8b6acb2442ca7baa69":
      NotificationFrom.THE_62_F60_E8_B6_ACB2442_CA7_BAA69
});

enum SourceRef {
  THE_637_B0_C67_C4577610074_E2693,
  THE_63774_B7_FC4577610074_E2189,
  THE_63746_C8_D4_A6_FED30_F5_FAE16_E
}

final sourceRefValues = EnumValues({
  "63746c8d4a6fed30f5fae16e": SourceRef.THE_63746_C8_D4_A6_FED30_F5_FAE16_E,
  "63774b7fc4577610074e2189": SourceRef.THE_63774_B7_FC4577610074_E2189,
  "637b0c67c4577610074e2693": SourceRef.THE_637_B0_C67_C4577610074_E2693
});

enum UserRef { THE_637468424_A6_FED30_F5_FAE155 }

final userRefValues = EnumValues(
    {"637468424a6fed30f5fae155": UserRef.THE_637468424_A6_FED30_F5_FAE155});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
