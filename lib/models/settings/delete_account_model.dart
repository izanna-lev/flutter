import 'dart:convert';

DeleteAccountModel deleteAccountModelFromJson(String str) =>
    DeleteAccountModel.fromJson(json.decode(str));

String deleteAccountModelToJson(DeleteAccountModel data) =>
    json.encode(data.toJson());

class DeleteAccountModel {
  DeleteAccountModel({
    required this.code,
    required this.message,
    required this.format,
  });

  int code;
  String message;
  String format;

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      DeleteAccountModel(
        code: json["code"],
        message: json["message"],
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "format": format,
      };
}
