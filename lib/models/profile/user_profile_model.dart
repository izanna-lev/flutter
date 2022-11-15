import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  UserProfileDetailsModel data;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        code: json["code"],
        message: json["message"],
        data: UserProfileDetailsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class UserProfileDetailsModel {
  UserProfileDetailsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
  });

  String id;
  String name;
  String image;
  String email;

  factory UserProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserProfileDetailsModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "email": email,
      };
}
