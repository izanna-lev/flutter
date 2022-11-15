import 'dart:convert';

CurrentUserModel currentUserModelFromJson(String str) =>
    CurrentUserModel.fromJson(json.decode(str));

String currentUserModelToJson(CurrentUserModel data) =>
    json.encode(data.toJson());

class CurrentUserModel {
  CurrentUserModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  UserModel data;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      CurrentUserModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: UserModel.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class UserModel {
  UserModel({
    required this.accessToken,
    required this.user,
  });

  String accessToken;
  UserData user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["accessToken"] ?? "",
        user: UserData.fromJson(json["user"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
      };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  String id;
  String name;
  String email;
  String image;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "image": image,
      };
}
