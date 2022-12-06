import 'dart:convert';

import '../login/user_model.dart';

EditProfileModel editProfileModelFromJson(String str) =>
    EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) =>
    json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  UserData data;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        code: json["code"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

// class EditProfileDataModel {
//   EditProfileDataModel({
//     required this.id,
//     required this.rowndId,
//     required this.email,
//     required this.deleted,
//     required this.blocked,
//     required this.v,
//     required this.device,
//     required this.fcmToken,
//     required this.image,
//   });
//
//   String id;
//   String rowndId;
//   String email;
//   bool deleted;
//   bool blocked;
//   int v;
//   String device;
//   String fcmToken;
//   String image;
//
//   factory EditProfileDataModel.fromJson(Map<String, dynamic> json) =>
//       EditProfileDataModel(
//         id: json["_id"],
//         rowndId: json["rowndId"],
//         email: json["email"],
//         deleted: json["deleted"],
//         blocked: json["blocked"],
//         v: json["__v"],
//         device: json["device"],
//         fcmToken: json["fcmToken"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "rowndId": rowndId,
//         "email": email,
//         "deleted": deleted,
//         "blocked": blocked,
//         "__v": v,
//         "device": device,
//         "fcmToken": fcmToken,
//         "image": image,
//       };
// }
