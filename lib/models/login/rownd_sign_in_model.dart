import 'dart:convert';

RowndSignInModel rowndSignInModelFromJson(String str) =>
    RowndSignInModel.fromJson(json.decode(str));

String rowndSignInModelToJson(RowndSignInModel data) =>
    json.encode(data.toJson());

class RowndSignInModel {
  RowndSignInModel({
    required this.code,
    required this.message,
    required this.data,
    required this.format,
    required this.timestamp,
  });

  int code;
  String message;
  RowndSignInDetailsModel data;
  String format;
  String timestamp;

  factory RowndSignInModel.fromJson(Map<String, dynamic> json) =>
      RowndSignInModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: RowndSignInDetailsModel.fromJson(json["data"]),
        format: json["format"] ?? "",
        timestamp: json["timestamp"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "format": format,
        "timestamp": timestamp,
      };
}

class RowndSignInDetailsModel {
  RowndSignInDetailsModel({
    required this.accessToken,
    required this.traveller,
  });

  String accessToken;
  Traveller traveller;

  factory RowndSignInDetailsModel.fromJson(Map<String, dynamic> json) =>
      RowndSignInDetailsModel(
        accessToken: json["accessToken"] ?? "",
        traveller: Traveller.fromJson(json["traveller"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "traveller": traveller.toJson(),
      };
}

class Traveller {
  Traveller({
    required this.id,
    required this.rowndId,
    required this.email,
    required this.deleted,
    required this.blocked,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
    required this.device,
    required this.fcmToken,
    required this.image,
    required this.stripeCustomerId,
  });

  String id;
  String rowndId;
  String email;
  bool deleted;
  bool blocked;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;
  String device;
  String fcmToken;
  String image;
  String stripeCustomerId;

  factory Traveller.fromJson(Map<String, dynamic> json) => Traveller(
        id: json["_id"] ?? "",
        rowndId: json["rowndId"] ?? "",
        email: json["email"] ?? "",
        deleted: json["deleted"] ?? false,
        blocked: json["blocked"] ?? false,
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ?? 0,
        device: json["device"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
        image: json["image"] ?? "",
        stripeCustomerId: json["stripeCustomerId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rowndId": rowndId,
        "email": email,
        "deleted": deleted,
        "blocked": blocked,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "device": device,
        "fcmToken": fcmToken,
        "image": image,
        "stripeCustomerId": stripeCustomerId,
      };
}
